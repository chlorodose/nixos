{ config, lib, hostConfig, ... }:
with lib;
let 
  cfg = config.user.authorizedKey;
in
{
  imports = [
    ./basic.nix
  ];

  options = {
    user.authorizedKey = mkOption {
      default = null;
      type = types.nullOr types.string;
    };
  };

  config = {
    home.file.".ssh/authorized_keys" = mkIf ((cfg != null) && hostConfig.services.openssh.enable) {
      text = cfg;
    };
  };
}