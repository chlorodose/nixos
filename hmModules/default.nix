{ hostConfig, ... }: {
  imports = [
    ./basic.nix
    ./fish.nix
    ./gpg.nix
    ./ssh-public.nix
  ] ++ (if hostConfig.host.isDesktop then [
    ./desktop
    ./apps
  ] else []);
}