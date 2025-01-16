{ config, lib, pkgs, ... }: {
  imports = [
    ./hyprland
    ./kitty
    ./fcitx5
    ./waybar
    ./swaync
    ./rofi
  ];
}
