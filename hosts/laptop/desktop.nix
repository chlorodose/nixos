{ config, lib, pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
  services.displayManager.defaultSession = "hyprland-uwsm";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.uwsm.enable = true;

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
    })
    pkgs.hyprpolkitagent
  ];
}
