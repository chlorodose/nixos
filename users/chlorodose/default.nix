{ config, lib, pkgs, isServer, ... }: {
  imports = [
    ./shell
    ./gpg
    ../modules/basic-home.nix
  ] ++ (if !isServer then [
    ./fonts
    ./desktop
    ./apps
  ] else [ ]);
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
    brightnessctl
    playerctl
  ];
}
