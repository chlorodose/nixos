{ config, lib, pkgs, ... }: {
  imports = [
    ./hyprland
    ./dunst
    ./kitty
    ./fcitx5
    ./wofi
  ];
}
