{ config, lib, pkgs, ... }: {
  imports = [
    ./netdev.nix
    ./network.nix
  ];
}
