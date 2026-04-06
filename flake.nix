{
  description = "learning nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-fuse-t = {
      url = "github:macos-fuse-t/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, determinate, ... }:
    let
      mkPkgs = system: import nixpkgs { inherit system; };

      mkDarwin = host:
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = mkPkgs "aarch64-darwin";
          modules = [
            inputs.determinate.darwinModules.default
            inputs.nix-homebrew.darwinModules.nix-homebrew
            ./hosts/${host}.nix
          ];
          specialArgs = { inherit inputs; };
        };

      mkHome = host: system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs system;
          modules = [
            ./hosts/${host}.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };
    in
    {
      darwinConfigurations = {
        c23 = mkDarwin "c23";
        mac624172 = mkDarwin "mac624172";
      };

      homeConfigurations = {
        tripper2 = mkHome "tripper2" "x86_64-linux";
      };
    };
}