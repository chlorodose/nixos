{ config, pkgs, lib, ... }:
with lib;{
  imports = [
    ./basic.nix
  ];
  environment.systemPackages = mkIf config.host.isDesktop (with pkgs; [
    nerd-fonts.fira-code
    wqy_zenhei
  ]);
}