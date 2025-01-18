{ config, pkgs, lib, ... }:
with lib;
let 
  cfg = config;
in
{
  imports = [
    ./modules/basic.nix
    ./modules/boot.nix
  ];

  options = {};

  config = {};
}