{ config, pkgs, lib, hostConfig, ... }:
with lib;
let cfg = config.user.gpg;
in {
  imports = [ ./basic.nix ];

  options = {
    user.gpg = {
      myKey = mkOption {
        default = null;
        type = types.nullOr types.path;
      };
    };
  };

  config = {
    programs.gpg = {
      enable = true;
      publicKeys = mkIf (cfg.myKey != null) [{
        source = cfg.myKey;
        trust = 5;
      }];
    };
    services.gpg-agent = {
      enable = hostConfig.host.isDesktop;
      enableExtraSocket = true;
      enableSshSupport = true;
      sshKeys = [ "998ACE872695C6C0A6A69745E7AB158817E18A1F" ];
      pinentryPackage = pkgs.pinentry-all;
    };
  };
}
