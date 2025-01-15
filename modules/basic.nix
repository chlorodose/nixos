{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nano
    wget
    curl
    git
    gnupg
  ];

  nix.gc = {
    automatic = true;
    dates = "03:15";
    randomizedDelaySec = "30min";
    options = "--delete-older-than 7d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "03:15" ];
  };

  i18n = {
    defaultLocale = "C.UTF-8";
    supportedLocales = [
      "C.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };

  time.timeZone = "Asia/Shanghai";

  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
