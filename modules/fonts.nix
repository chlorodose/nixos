{ pkgs, lib, ... }:
with lib;{
  imports = [
    ./basic.nix
  ];
  environment.systemPackages = with pkgs; [
    fira-code-nerdfont
    wqy_zenhei
  ];
}