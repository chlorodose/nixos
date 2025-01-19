{ config, hmSpecialArgs, ... }: {
  imports = [
    ./modules/basic.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/services/ddns.nix
    ./modules/services/ups.nix
    ./modules/services/mihomo.nix
    ./modules/users/chlorodose.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  home-manager.extraSpecialArgs = hmSpecialArgs // { hostConfig = config; };
}
