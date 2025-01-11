{ config, lib, pkgs, ... }: {
  imports = [
    ./netdev.nix
    ./slaves.nix
    ./network.nix
  ];
}
