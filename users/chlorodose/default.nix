{ config, lib, pkgs, isServer, ... }: {
  imports = [
    ./fish
    ./gpg
    ../modules/basic-home.nix
  ] ++ (if !isServer then [ 
    ./fonts
    ./fcitx5
    ./terminal
  ] else []);
  home.packages = with pkgs; [
    btop
    iotop
    iftop
    strace
    ltrace
    lsof
    lm_sensors
    pciutils
    usbutils
    nmap
    socat
    fastfetch
    nixd
    nixpkgs-fmt
  ];
}
