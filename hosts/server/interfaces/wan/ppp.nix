{ config, lib, pkgs, ... }: {
  services.pppd.enable = true;
  
  services.pppd.peers."wan" = {
    name = "wan";
    enable = true;
    config = ''
      plugin pppoe.so

      linkname wan
      ifname wan

      enp6s0

      persist
      lcp-echo-interval 15
      lcp-echo-failure 3

      deflate 15
      predictor1
      bsdcomp 15

      noauth
      file /etc/secrets/ppp/secret.conf

      noproxyarp
      nodefaultroute

      up_sdnotify
    '';
  };

  systemd.services."pppd-wan" = {
    before = [ "systemd-networkd.service" ];
    bindsTo = [ "sys-subsystem-net-devices-enp6s0.device" ];
    after = [ "sys-subsystem-net-devices-enp6s0.device" ];
    serviceConfig = {
      Type = "notify";
    };
    preStart = "${pkgs.iproute2}/bin/ip link set enp6s0 up";
    postStart = "${pkgs.systemd}/bin/networkctl reconfigure wan";
  };
}