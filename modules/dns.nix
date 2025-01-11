{ config, lib, pkgs, ... }: {
  services.resolved.enable = true;
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.search = [ "~." ];
}
