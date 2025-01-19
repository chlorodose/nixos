{ config, pkgs, lib, ... }:
with lib;
let cfg = config.host;
in {
  options = {
    host.isDesktop = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Set to true when system is desktop.
      '';
    };
  };

  config = {
    environment.systemPackages = with pkgs; [ nano wget curl git gnupg ];

    services.openssh.enable = !cfg.isDesktop;

    nix.gc = {
      automatic = true;
      dates = "03:15";
      randomizedDelaySec = "30min";
      options = "--delete-older-than 7d";
    };
    nix.settings.auto-optimise-store = true;
    nix.settings.trusted-users = [ "root" "@wheel" ];
    nix.daemonCPUSchedPolicy = mkIf cfg.isDesktop "idle";
    nix.daemonIOSchedClass = mkIf cfg.isDesktop "idle";

    i18n = {
      defaultLocale = "C.UTF-8";
      supportedLocales = [ "C.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" ];
    };

    time.timeZone = "Asia/Shanghai";

    networking = {
      useDHCP = false;
      useNetworkd = true;
      nftables.enable = true;
    };

    nix.settings.substituters =
      [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";
  };
}
