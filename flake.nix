{
  description = "learning nix";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/master";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    fenix.url = "github:nix-community/fenix";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Brew (mac-only; safe to keep as inputs)
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

  outputs = inputs:
    let mkPkgs = system: import inputs.nixpkgs { inherit system; };
    in {
      darwinConfigurations = {
        c23 = inputs.darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = mkPkgs "aarch64-darwin";
          modules = [ ./hosts/c23 ];
          specialArgs = { inherit inputs; };
        };

        mac624172 = inputs.darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = mkPkgs "aarch64-darwin";
          modules = [ ./hosts/mac624172 ];
          specialArgs = { inherit inputs; };
        };
      };

      # Ubuntu / Home Manager (Option 2)
      homeConfigurations = {
        tripper2 = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs "x86_64-linux"; # change to "aarch64-linux" if needed
          modules = [ ./hosts/tripper2 ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
