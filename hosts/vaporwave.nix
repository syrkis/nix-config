{
  inputs,
  pkgs,
  lib,
  ...
}:
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
    stateVersion = "25.11";
  };

  home.packages = [
    pkgs.syncthing
  ];

  systemd.user.services.syncthing = lib.mkIf pkgs.stdenv.isLinux {
    Unit = {
      Description = "Syncthing";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "${pkgs.syncthing}/bin/syncthing --no-browser --no-restart";
      Restart = "on-failure";
      RestartSec = 5;
      SuccessExitStatus = "3 4";
      RestartForceExitStatus = "3 4";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
