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
      in {
        cl-server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = nixosSpecialArgs;
          modules = nixosModules ++ [{}];
        };
        cl-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = nixosSpecialArgs;
          modules = nixosModules ++ [{
            host.isDesktop = true;
          }];
        };
      };
  };
}
