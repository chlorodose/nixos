{ config, hmSpecialArgs, ... }: {
  imports = [
    ./modules
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  home-manager.extraSpecialArgs = hmSpecialArgs // { hostConfig = config; };
}
