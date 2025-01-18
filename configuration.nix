{ config, pkgs, lib, ... }:
with lib;
let 
  cfg = config;
in
{
  imports = [
    ./modules/basic.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/services/ddns.nix
    ./modules/services/ups.nix
    ./modules/services/mihomo.nix
  ];

  options = {};

  config = {};
}