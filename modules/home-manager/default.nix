{ pkgs, lib, ... }:
{
  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/shell.nix
  ];

  # macOS-only defaults
  targets.darwin.currentHostDefaults = lib.mkIf pkgs.stdenv.isDarwin {
    "com.apple.controlcenter".BatteryShowPercentage = true;
  };

  home.stateVersion = "25.11";
}
