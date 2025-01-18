{
  description = "My configuration for nixos";

  inputs = {
    nixpkgs = {
      url =  "github:nixos/nixpkgs/nixos-unstable";
    };
    agenix = {
      url = "github:ryantm/agenix";
    };
  };

  outputs = { self, nixpkgs, agenix }@inputs: {
    nixosConfigurations = let
      nixosModules = [
        agenix.nixosModules.default
        (import ./overlays)
        (import ./configuration.nix)
      ];
      nixosSpecialArgs = {};
      in {
        cl-server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = nixosSpecialArgs;
          modules = nixosModules ++ [(import ./hosts/cl-server.nix)];
        };
        cl-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = nixosSpecialArgs;
          modules = nixosModules ++ [(import ./hosts/cl-laptop.nix)];
        };
      };
  };
}
