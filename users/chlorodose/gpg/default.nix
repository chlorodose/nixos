{ config, lib, pkgs, isServer, ... }: {
  programs.gpg = {
    enable = true;
    mutableKeys = false;
    mutableTrust = false;
    publicKeys = [
      {
        source = ./chlorodose_public.asc;
        trust = 5;
      }
    ];
  };
  services.gpg-agent = (if isServer then
    { enable = false; }
  else {
    enable = true;
    enableExtraSocket = true;
    enableSshSupport = true;
    sshKeys = [ "998ACE872695C6C0A6A69745E7AB158817E18A1F" ];
    pinentryPackage = pkgs.pinentry-all;
  }
  );
}
