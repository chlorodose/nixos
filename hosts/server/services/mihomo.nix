{ config, lib, pkgs, ... }: {
  services.mihomo = {
    enable = true;
    webui = pkgs.metacubexd;
    configFile = "/etc/secrets/mihomo/config.yaml";
  };
}
