{ config, lib, pkgs, ... }:
let
  mkList = list: lib.concatLines (map (path: "source = ${path}") list);
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # for UWSM
    xwayland.enable = false;
    extraConfig = mkList [
      ./config/programs.conf
      ./config/monitors.conf
      ./config/xf86keys.conf
      ./config/hyprland.conf
    ];
  };
}
