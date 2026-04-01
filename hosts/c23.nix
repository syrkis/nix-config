{ inputs, ... }:
let
  username = "nobr";
in
{
  imports = [
    ../modules/darwin.nix
    ../modules/homebrew.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  networking.hostName = "c23";

  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username}.imports = [ ../modules/home.nix ];
    extraSpecialArgs = { inherit inputs; };
  };
}