{ config, lib, pkgs, isServer, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # for UWSM
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, space, exec, kitty"
      "$mod, e, exec, codium"
      "$mod, b, exec, firefox"

      "$mod SHIFT, space, togglefloating,"
      "$mod SHIFT, f, fullscreen,"

      "$mod CTRL, e, exit,"
    ];
  };
}
