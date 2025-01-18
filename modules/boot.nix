{ config, pkgs, lib, ... }:
with lib;
let cfg = config.host;
in {
  options = {
    host.isInstalling = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Set to true when running in the installation environment.
      '';
    };
    host.isDesktop = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Set to true when system is desktop.
      '';
    };
  };

  config = {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 32;
    };
    systemd.watchdog.runtimeTime = "30s";
    boot.loader.efi.canTouchEfiVariables = cfg.isInstalling;
    boot.kernelPackages = 
      if cfg.isDesktop then pkgs.linuxPackages_zen else pkgs.linuxPackages_latest;
    #boot.loader.systemd-boot.extraInstallCommands = ''
    #  default_entry="''$(${pkgs.gawk}/bin/awk ' ''$1=="default" {print ''$2} ' /boot/loader/loader.conf)"
    #  ${pkgs.coreutils}/bin/mv "/boot/loader/entries/''${default_entry}" "/boot/loader/entries/''${default_entry::-5}+1.conf"
    #  ${pkgs.gnused}/bin/sed -i '/^default/d' /boot/loader/loader.conf
    #'';
  };
}
