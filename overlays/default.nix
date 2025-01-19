{ config, lib, pkgs, ... }:
let args = { inherit config lib pkgs; };
in { nixpkgs.overlays = [ ((import ./ppp.nix) args) ]; }
