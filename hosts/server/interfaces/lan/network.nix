{ config, lib, pkgs, ... }: {
  systemd.network.networks."10-lan" = {
    matchConfig = {
      Name = "lan";
    };
    networkConfig = {
      Address = [ "192.168.0.1/24" ];
      LLDP = true;
      EmitLLDP = true;
      MulticastDNS = true;
      LLMNR = true;
      DHCPServer = true;
      IPv6SendRA = true;
      IPv6AcceptRA = false;
      DHCPPrefixDelegation = true;
      IPv4Forwarding = true;
      IPv6Forwarding = true;
    };
    dhcpServerConfig = {
      PoolOffset = 100;
      PoolSize = 128;
      EmitDNS = true;
      DNS = [ "223.5.5.5" /*"1.1.1.1"*/ ];
      EmitRouter = true;
      EmitTimezone = true;
      # SendOption = "121:192.168.1.0/24:192.168.0.1";
    };
    dhcpPrefixDelegationConfig = {
      UplinkInterface = "wan";
      SubnetId = 0;
      Announce = true;
    };
    ipv6SendRAConfig = {
      Managed = true;
      OtherInformation = true;
      EmitDNS = true;
      DNS = [ "2400:3200::1" /*"2606:4700:4700::1111"*/ ];
    };
    bridgeConfig = {
      ProxyARP = true;
    };
  };
}