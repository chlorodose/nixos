{ config, lib, pkgs, ... }: {
  environment.systemPackages = [ pkgs.networkmanager ];
}