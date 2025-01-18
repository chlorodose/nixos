{ pkgs, lib, ... }:
with lib;
let cfg = host.services.mihomo;
in {
  imports = [ ../basic.nix ];

  options = {
    host.services.mihomo = { enable = mkEnableOption "Enable mihomo service"; };
  };

  config = {
    services.mihomo = mkIf cfg.enable {
      enable = true;
      webui = pkgs.metacubexd;
      configFile = "/etc/secrets/mihomo/config.yaml";
    };
  };
}
