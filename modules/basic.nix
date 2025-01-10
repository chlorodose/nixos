{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nano
    wget
    curl
    git
    gnupg
  ];
  
  time.timeZone = "Asia/Shanghai";
  
  nix.settings.substituters = lib.mkForce [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}