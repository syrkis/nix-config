{ ... }: {
  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/shell.nix
    # ./programs/terminal.nix
    # ./dotfiles.nix
  ];

  # Link apps to /Applications on macOS
  targets.darwin.currentHostDefaults = {
    "com.apple.controlcenter".BatteryShowPercentage = true;
  };

  # targets.darwin.applications = { enable = true; };

  home.stateVersion = "25.11";
}
