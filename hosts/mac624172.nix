{ inputs, pkgs, ... }:
let
  username = "nobr";
in
{
  imports = [
    ../modules/darwin.nix
    #    ../modules/homebrew.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  networking.hostName = "mac624172";

  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.fish;
  };

  launchd.user.agents.syncthing = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.syncthing}/bin/syncthing"
        "--no-browser"
      ];
      KeepAlive = true;
      RunAtLoad = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username}.imports = [ ../modules/home.nix ];
    extraSpecialArgs = { inherit inputs; };
  };
}
