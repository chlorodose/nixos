{ config, lib, pkgs, ... }: {
  imports = [
    ./mihomo.nix
    ./ddns.nix
    ./ups.nix
    ./openwrt.nix
  ];
  services.openssh.enable = true;
}
