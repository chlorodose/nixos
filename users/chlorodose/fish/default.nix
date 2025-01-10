{ config, lib, pkgs, proxyHost, ... }: {

  home.packages = with pkgs; [
    fishPlugins.z
    fishPlugins.tide
    fishPlugins.grc
    grc
    fishPlugins.fzf
    fzf
    fishPlugins.plugin-sudope
  ];

  programs.fish = {
    enable = true;
    functions = {
      pxyon = ''
        export http_proxy="http://${proxyHost}:7890"
        export https_proxy="http://${proxyHost}:7890"
        export all_proxy="socks5://${proxyHost}:7891"
      '';
      pxyoff = ''
        set -e http_proxy
        set -e https_proxy
        set -e all_proxy
      '';
      update-system = ''
        fish -c "cd /etc/nixos && pxyon && sudo -E git pull && sudo nixos-rebuild switch"
      '';
    };
  };

  home.file.".config/fish/conf.d/configure.fish" = {
    source = ./configure.fish;
    executable = true;
  };
}
