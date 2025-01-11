{ config, lib, pkgs, ... }: {
  programs.waybar.enable = true;
  programs.waybar.systemd.enable = true;
}
