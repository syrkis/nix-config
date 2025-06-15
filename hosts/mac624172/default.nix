{ inputs, ... }: {
  imports = [
    ../../modules/darwin
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # Set primary user for this host
  system.primaryUser = "nobr";

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;

    # User owning the Homebrew prefix
    user = "nobr";

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "macos-fuse-t/homebrew-cask" = inputs.homebrew-fuse-t;
    };

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;

    # Optional: Enable fully-declarative tap management
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`
    mutableTaps = false;
  };

  users.users.nobr = {
    name = "nobr";
    home = "/Users/nobr";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nobr.imports = [ ../../modules/home-manager ];
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
}
