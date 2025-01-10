{ config, lib, pkgs, ... }: {
  systemd.network.networks = {
    "10-lan0" = {
      matchConfig = {
        MACAddress = "00:1b:21:c6:87:58";
      };
      networkConfig = {
        Bridge = "lan";
      };
    };
    "10-lan1" = {
      matchConfig = {
        MACAddress = "00:1b:21:c6:87:5a";
      };
      networkConfig = {
        Bridge = "lan";
      };
    };
    "10-container-ve" = {
      matchConfig = {
        Kind = "veth";
        Name = "ve-*";
      };
      networkConfig = {
        Bridge = "lan";
      };
    };
  };
}