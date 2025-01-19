{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # for UWSM
    xwayland.enable = false;
    settings = {
      "$mod" = "SUPER";
      "monitor" = ",preferred,auto,auto";
      "$appPrefix" = "uwsm app --";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";
      source = [
        "${./hyprland.conf}"
      ];
    };
  };
}
