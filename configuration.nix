{ config, pkgs, lib, ... }:
with lib;
let 
  cfg = config;
in
{
  imports = [
    ./modules/boot.nix
  ];

  options = {};

  config = {};
}