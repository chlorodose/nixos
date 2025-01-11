{ config, lib, pkgs, ... }: {
  programs.home-manager.enable = true;

  home.language.base = "zh_CN.UTF-8";

  home.stateVersion = "24.11";
}
