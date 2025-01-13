{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    wqy_zenhei
  ];
}
