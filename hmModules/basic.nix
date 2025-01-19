{ config, lib, ... }:
with lib;
let cfg = config.user;
in {
  options = {
    user.isGraphical = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Set to true when user wants graphical interface.
      '';
    };
  };

  config = {
    programs.home-manager.enable = true;

    home.language.base = "zh_CN.UTF-8";

    home.stateVersion = "25.05";
  };
}
