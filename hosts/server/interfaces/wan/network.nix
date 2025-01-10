{ config, lib, pkgs, ... }: {
  systemd.network.networks."10-wan" = {
    matchConfig = {
      Type = "ppp";
      Name = "wan";
    };
    linkConfig = {
      RequiredForOnline = true;
    };
    networkConfig = {
      DHCP = "ipv6";
      LLMNR = false;
      IPv6AcceptRA = true;
      KeepConfiguration = true;
      DefaultRouteOnDevice = true;
      IPv4Forwarding = true;
      IPv6Forwarding = true;
      DHCPPrefixDelegation = true;
    };
    dhcpPrefixDelegationConfig = {
      UplinkInterface = ":self";
      SubnetId = 0;
      Announce = false;
      RouteMetric = 4294967295;
    };
    dhcpV6Config = {
      UseAddress = true;
      UseDelegatedPrefix = true;
    };
  };
    
}