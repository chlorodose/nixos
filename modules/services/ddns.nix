{ lib, ... }:
with lib;
let cfg = host.services.ddns;
in {
  imports = [ ../basic.nix ];

  options = {
    host.services.ddns = { enable = mkEnableOption "Enable DDNS service"; };
  };

  config = {
    services.ddclient = mkIf cfg.enable {
      enable = true;
      verbose = true;
      interval = "10min";
      ssl = true;
      usev4 = "ifv4, if=wan";
      usev6 = "ifv6, if=wan";
      protocol = "cloudflare";
      zone = "chlorodose.me";
      username = "token";
      passwordFile = "/etc/secrets/ddclient/secret.key";
      domains = [ "home-ppp.chlorodose.me" ];
    };
  };
}