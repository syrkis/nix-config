{ inputs, ... }: {
  imports = [
    ../../modules/darwin
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # Set primary user for this host
  system.primaryUser = "syrkis";

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = false;

    # User owning the Homebrew prefix
    user = "syrkis";

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;

    # Optional: Enable fully-declarative tap management
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`
    mutableTaps = false;
  };

  users.users.syrkis = {
    name = "syrkis";
    home = "/Users/syrkis";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.syrkis.imports = [ ../../modules/home-manager ];
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
}