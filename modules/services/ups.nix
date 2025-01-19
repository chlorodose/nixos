{ config, lib, pkgs, ... }:
with lib;
let cfg = config.host.services.ups;
in {
  imports = [ ../basic.nix ];

  options = {
    host.services.ups = { enable = mkEnableOption "Enable UPS service"; };
  };

  config = {
    power.ups = mkIf cfg.enable {
      enable = true;
      mode = "standalone";
      ups."UPS" = {
        driver = "nutdrv_qx";
        description = "UPS";
        port = "auto";
        summary = ''
          vendorid = "0665"
          productid = "5161"
        '';
      };

      users."ups" = {
        upsmon = "primary";
        instcmds = [ "ALL" ];
        actions = [ "SET" ];
        passwordFile = "/dev/null";
      };

      upsmon.monitor.ups = {
        user = "ups";
        passwordFile = "/dev/null";
        system = "ups@localhost";
      };
      upsmon.settings = {
        DEADTIME = 5;
        NOCOMMWARNTIME = 30;
        NOTIFYFLAG = [
          [ "ONLINE" "SYSLOG" ]
          [ "ONBATT" "SYSLOG+WALL+EXEC" ]
          [ "LOWBATT" "SYSLOG+WALL+EXEC" ]
        ];
        POLLFREQ = 2;
        POLLFREQALERT = 1;
        RUN_AS_USER = "root";
        SHUTDOWNCMD = "${pkgs.systemd}/bin/systemctl poweroff";
      };
    };
  };
}
