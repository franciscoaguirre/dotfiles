{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    claude-code.url = "github:sadjow/claude-code-nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, claude-code, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/default/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.francisco = import ./hosts/default/home.nix;

            home-manager.extraSpecialArgs = {
              inherit inputs pkgs-unstable;
              system = "x86_64-linux";
            };
          }
        ];
      };
    };
  };
}
