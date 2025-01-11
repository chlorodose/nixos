{ config, lib, pkgs, isServer, ... }: {
  imports = [
    ./shell
    ./gpg
    ../modules/basic-home.nix
  ] ++ (if !isServer then [ 
    ./fonts
    ./fcitx5
    ./terminal
    ./desktop
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
    nix-tree
  ];
}
