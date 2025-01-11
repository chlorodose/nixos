{ config, lib, pkgs, isServer, ... }: {
  programs.fish.enable = true;
  users.users.chlorodose = {
    isNormalUser = true;
    home = "/home/chlorodose";
    createHome = true;
    extraGroups = [ "wheel" ] ++ (if !isServer then [
      "networkmanager"
    ] else [ ]);
    shell = pkgs.fish;
    initialHashedPassword = "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAaNOI0M0BjQyFvPZzhgZblw0bkTiWm7ATe28";
  };
}
