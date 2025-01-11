{ config, lib, pkgs, ... }: {
  imports = [
    ./lan
    ./wan
    ./wg
  ];
  networking.useDHCP = false;
  systemd.network.enable = true;
}
