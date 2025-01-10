{ config, lib, pkgs, ... }: {
  imports = [
    ./fish
    ./gpg
    ../modules/basic-home.nix
  ];
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
