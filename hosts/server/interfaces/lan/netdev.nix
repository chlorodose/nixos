{ config, lib, pkgs, ... }: {
  systemd.network.netdevs."10-lan" = {
    netdevConfig = {
      Description = "Lan Network Bridge";
      Name = "lan";
      Kind = "bridge";
    };
  };
}