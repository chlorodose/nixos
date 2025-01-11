{ config, lib, pkgs, ... }: {
  systemd.network.networks."10-wg" = {
    matchConfig = {
      Name = "wg";
      Type = "wireguard";
    };
    networkConfig = {
      Address = "192.168.1.1/24";
      IPv4ProxyARP = true;
      IPv4Forwarding = true;
      IPv6Forwarding = true;
    };
  };
}
