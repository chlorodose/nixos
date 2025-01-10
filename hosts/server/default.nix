{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./firewall
    ./interfaces
    ./services
  ];
}