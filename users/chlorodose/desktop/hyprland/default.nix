{ config, lib, pkgs, isServer, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # for UWSM
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, space, exec, uwsm app -- kitty"
      "$mod, e, exec, uwsm app -- codium"
      "$mod, b, exec, uwsm app -- firefox"


      "$mod SHIFT, space, togglefloating,"
      "$mod SHIFT, f, fullscreen,"

      "$mod CTRL, e, exit,"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];
    decoration.blur.enabled = false;
  };
}
