{ lib, pkgs, hostConfig, ... }:
with lib; {
  imports = [ ./basic.nix ];
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
      pxyon = mkIf (hostConfig.networking.proxyHost != null) ''
        export http_proxy="http://${hostConfig.networking.proxyHost}:7890"
        export https_proxy="http://${hostConfig.networking.proxyHost}:7890"
        export all_proxy="socks5://${hostConfig.networking.proxyHost}:7891"
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
    shellInitLast = ''
      if test -z "$__fish_configured"
        set -U __fish_configured 1
        set -U fish_escape_delay_ms 500
        tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='24-hour format' --rainbow_prompt_separators=Angled --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Sparse --icons='Many icons' --transient=No
      end
    '';
  };
}
