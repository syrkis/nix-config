{ inputs, ... }:
let
  username = "nobr";
in
{
  imports = [
    ../modules/home.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
}