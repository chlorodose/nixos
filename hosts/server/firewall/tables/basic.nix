{ config, lib, pkgs, ... }: {
  networking.nftables.tables."basic" = {
    name = "basic";
      family = "inet";
      content = ''
        set good_icmp_types {
            type icmp_type
            elements = { echo-request, echo-reply, time-exceeded, destination-unreachable }
        }
        set good_icmpv6_types {
            type icmpv6_type
            elements = { echo-request, echo-reply, time-exceeded, destination-unreachable, packet-too-big, nd-router-solicit, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert, nd-redirect }
        }
        chain input {
            type filter hook input priority filter; policy drop;
            iifname "lo" accept
            iifname { "lan", "wg" } accept
            jump contrack
            iifname { "wan" } goto wan_input
        }
        chain forward {
            type filter hook forward priority filter; policy accept;
            counter
            jump contrack
            iifname { "wan" } goto wan_forward
        }
        chain output {
            type filter hook output priority filter; policy accept;
        }
        chain wan_input {
            udp dport 68 counter accept comment "Accept DHCP"
            udp dport 546 counter accept comment "Accept DHCPv6"
            ip protocol igmp counter accept comment "Accept IGMP"
            ip protocol icmp icmp type @good_icmp_types counter accept comment "Accept good ICMP types"
            ip protocol icmp counter drop comment "Drop other ICMP types"
            ip6 nexthdr icmpv6 icmpv6 type @good_icmpv6_types counter accept comment "Accept good ICMPv6 types"
            ip6 nexthdr icmpv6 counter drop comment "Drop other ICMPv6 types"
            udp dport 51820 counter accept comment "Accept WireGuard"
            drop
        }
        chain wan_forward {
            ip6 nexthdr icmpv6 icmpv6 type @good_icmpv6_types counter accept comment "Accept good ICMPv6 types"
            ip6 nexthdr icmpv6 counter drop comment "Drop other ICMPv6 types"
            drop
        }
        chain contrack {
            ct state established,related accept
            ct state invalid drop
            return
        }
        chain srcnat {
            type nat hook postrouting priority srcnat; policy accept;
            oifname { "wan" } meta nfproto ipv4 masquerade
        }
        chain pppoe_mtu_fix {
            type filter hook forward priority mangle; policy accept;
            iifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
            oifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
        }
      '';
  };
}