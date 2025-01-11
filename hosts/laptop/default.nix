{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./desktop.nix
    ./network.nix
  ];
}
