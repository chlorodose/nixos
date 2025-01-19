{ config, lib, pkgs, ... }:
with lib;
let cfg = config.user;
in {
  options = {
    user.isGraphical = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Set to true when user wants graphical interface.
      '';
    };
  };

  config = {
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
      ripgrep
      fd
      lazygit
    ];

    programs.home-manager.enable = true;

    home.language.base = "zh_CN.UTF-8";

    home.stateVersion = "25.05";
  };
}
