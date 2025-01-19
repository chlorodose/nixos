{
  description = "My configuration for nixos";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    agenix = {
      url = "github:ryantm/agenix/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { self, nixpkgs, home-manager, agenix, ... }@inputs: {
    nixosConfigurations = let
      hmSpecialArgs = { };
      nixosSpecialArgs = { inherit hmSpecialArgs; };
      hmModules =
        [ inputs.nixvim.homeManagerModules.nixvim (import ./home.nix) ];
      nixosModules = [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        { home-manager.sharedModules = hmModules; }
        (import ./overlays)
        (import ./configuration.nix)
      ];
    in {
      cl-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = nixosSpecialArgs;
        modules = nixosModules ++ [ (import ./hosts/cl-server.nix) ];
      };
      cl-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = nixosSpecialArgs;
        modules = nixosModules ++ [ (import ./hosts/cl-laptop.nix) ];
      };
    };
  };
}
