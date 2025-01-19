{ config, pkgs, lib, ... }:
with lib;
let cfg = config.host.services.mihomo;
in {
  imports = [ ../basic.nix ];

  options = {
    host.services.mihomo = { enable = mkEnableOption "Enable mihomo service"; };
    networking.proxyHost = mkOption {
      default = if cfg.enable then "127.0.0.1" else null;
      type = types.nullOr types.str;
      description = ''
        Hostname use for proxy.
      '';
    };
  };

  config = {
    services.mihomo = mkIf cfg.enable {
      enable = true;
      webui = pkgs.metacubexd;
      configFile = "/etc/secrets/mihomo/config.yaml";
    };
  };
}
