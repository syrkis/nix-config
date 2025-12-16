{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../modules/home-manager
  ];

  home.username = "nobr";
  home.homeDirectory = "/home/nobr";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  # optional: put host-specific packages here
  # home.packages = with pkgs; [ ... ];
}
