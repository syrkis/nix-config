{ ... }: {
  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/shell.nix
  ];

  # Link apps to /Applications on macOS
  targets.darwin.currentHostDefaults = {
    "com.apple.controlcenter".BatteryShowPercentage = true;
  };

  home.stateVersion = "25.11";
}
