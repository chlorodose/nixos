{...}@args:
{
  nixpkgs.overlays = [
    (import ./ppp.nix args)
  ];
}