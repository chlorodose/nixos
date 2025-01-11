{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # for UWSM
    xwayland.enable = true;
  };
  home.file.".config/hypr" = {
    source = ./config;
    recursive = true;
  };
}
