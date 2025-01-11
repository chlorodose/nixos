{ config, lib, pkgs, isServer, ... }: {
  home.packages = [ pkgs.firefox ];
}
