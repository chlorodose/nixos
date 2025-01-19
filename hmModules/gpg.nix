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
      publicKeys = mkIf (cfg.gpg != null) [{
        source = cfg.gpg;
        trust = 5;
      }];
    };
    services.gpg-agent = {
      enable = hostConfig.isDesktop;
      enableExtraSocket = true;
      enableSshSupport = true;
      sshKeys = [ "998ACE872695C6C0A6A69745E7AB158817E18A1F" ];
      pinentryPackage = pkgs.pinentry-all;
    };
  };
}
