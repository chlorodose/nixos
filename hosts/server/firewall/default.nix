{ config, lib, pkgs, ... }: {
  imports = [
    ./tables
  ];
  networking.firewall.enable = false;
  networking.nftables.enable = true;
}