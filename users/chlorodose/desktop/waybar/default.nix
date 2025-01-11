{ config, lib, pkgs, ... }: {
  programs.waybar.enable = true;
  programs.waybar.systemd.enable = true;
  home.file.".config/waybar" = {
    source = ./config;
    recursive = true;
  };
}
