{ config, lib, pkgs, ... }: {
  systemd.network.networks."10-base-wan" = {
    matchConfig = {
      MACAddress = "22:44:4d:03:14:d2";
    };
    linkConfig = {
      Unmanaged = true;
    };
  };
}