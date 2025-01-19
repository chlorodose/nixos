{ config, pkgs, lib, ... }:
with lib;
let cfg = config.user.users.chlorodose;
in {
  imports = [ ../basic.nix ];

  options = {
    user.users.chlorodose = { enable = mkEnableOption "Enable Chlorodose"; };
  };

  config = {
    programs.fish.enable = mkIf cfg.enable true;
    users.users.chlorodose = mkIf cfg.enable {
      isNormalUser = true;
      uid = 1000;
      home = "/home/chlorodose";
      createHome = true;
      extraGroups = [ "wheel" ]
        ++ (if !isServer then [ "networkmanager" ] else [ ]);
      shell = pkgs.fish;
      initialHashedPassword =
        "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAaNOI0M0BjQyFvPZzhgZblw0bkTiWm7ATe28";
    };
    home-manager.users.chlorodose = mkIf cfg.enable (import ../../users/chlorodose.nix);
  };
}
