{ config, lib, pkgs, ... }: {
  systemd.network.netdevs."10-wg" = {
    netdevConfig = {
      Description = "Wireguard VPN Tunnel";
      Name = "wg";
      Kind = "wireguard";
    };
    wireguardConfig = {
      ListenPort = 51820;
      PrivateKeyFile = "/etc/secrets/wireguard/private.key";
    };
    wireguardPeers = [
      {
        # Phone
        PublicKey = "12+lveD6bhdlprqxP9lxLx0nHpOI575L0ORbBjpUIys=";
        PresharedKeyFile = "/etc/secrets/wireguard/preshared/phone.key";
        PersistentKeepalive = 25;
        AllowedIPs = [ "0.0.0.0/0" "::/0" ];
      }
    ];
  };
}
