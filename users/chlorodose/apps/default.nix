{ config, lib, pkgs, ... }: {
  imports = [
    ./firefox
    ./vscodium
  ];
}
