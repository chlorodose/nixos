{
  description = "My configuration for nixos";

  inputs = {
    nixpkgs = {
      url =  "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations = let
      nixosModules = [
        (import ./overlays)
        (import ./configuration.nix)
      ];
      nixosSpecialArgs = {};
      in {};
  };
}
