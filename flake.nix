{
  description = "learning nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    fenix.url = "github:nix-community/fenix";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

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

  outputs = inputs@{
    nixpkgs,
    darwin,
    home-manager,
    ...
  }:
    let
      mkPkgs = system: import nixpkgs { inherit system; };

      mkDarwin = host:
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = mkPkgs "aarch64-darwin";
          modules = [
            ./hosts/${host}.nix
            inputs.nix-homebrew.darwinModules.nix-homebrew
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