{ config, lib, pkgs, ... }: {
  nixpkgs.overlays = [
    (
      final: prev: {
        ppp = prev.ppp.overrideAttrs (finalAttrs: previousAttrs: {
          configureFlags = previousAttrs.configureFlags ++ [ "--enable-systemd" ];
          buildInputs = previousAttrs.buildInputs ++ [ pkgs.systemd ];
        });
      }
    )
  ];
}
