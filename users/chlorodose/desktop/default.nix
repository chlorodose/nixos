{ config, lib, pkgs, isServer, ... }: {
  imports = [
    ./hyprland.nix
    ./notificaation.nix
  ];
}