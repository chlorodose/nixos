{ config, lib, pkgs, isServer, ... }: {
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 120;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.systemd-boot.extraInstallCommands = ''
  #  default_entry="''$(${pkgs.gawk}/bin/awk ' ''$1=="default" {print ''$2} ' /boot/loader/loader.conf)"
  #  ${pkgs.coreutils}/bin/mv "/boot/loader/entries/''${default_entry}" "/boot/loader/entries/''${default_entry::-5}+1.conf"
  #  ${pkgs.gnused}/bin/sed -i '/^default/d' /boot/loader/loader.conf
  #'';
  boot.kernelPackages =
    if isServer then pkgs.linuxPackages_latest else pkgs.linuxPackages_zen;
  systemd.watchdog.runtimeTime = "30s";
}
