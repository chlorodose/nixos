{
  description = "My configuration tree for nixos";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }: {
    nixosConfigurations."cl-server" =
      let
        system = "x86_64-linux";
        specialArgs = {
          proxyHost = "localhost";
          isServer = true;
          pkgs-stable = import nixpkgs-stable { inherit system; };
        };
      in
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          { networking.hostName = "cl-server"; }
          ./overlays

          ./hosts/server

          ./modules/boot.nix
          ./modules/dns.nix
          ./modules/basic.nix

          ./users/chlorodose.nix
          ./users/ling.nix
          ./users/tiger.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.chlorodose = import ./users/chlorodose;
            home-manager.users.ling = import ./users/ling;
            home-manager.users.tiger = import ./users/tiger;
          }
        ];
      };

    nixosConfigurations."cl-laptop" =
      let
        system = "x86_64-linux";
        specialArgs = {
          proxyHost = "192.168.0.1";
          isServer = false;
          pkgs-stable = import nixpkgs-stable { inherit system; };
        };
      in
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          { networking.hostName = "cl-laptop"; }
          ./overlays

          ./hosts/laptop

          ./modules/boot.nix
          ./modules/dns.nix
          ./modules/basic.nix

          ./users/chlorodose.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.chlorodose = import ./users/chlorodose;
          }
        ];
      };
  };
}
