{ config, lib, pkgs, ... }: {
  imports = [
    ./base-network.nix
    ./ppp.nix
    ./network.nix
  ];
}
