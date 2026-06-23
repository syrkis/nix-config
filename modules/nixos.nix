# modules/nixos.nix
{ pkgs, lib, ... }:
let
  runtimeLibs = with pkgs; [
    gcc.cc.lib
    zlib
  ];
in
{
  services.tailscale.enable = true;

  services.pcscd.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
    libu2f-host
  ];

  console.keyMap = lib.mkForce "us";
  services.xserver.xkb.layout = lib.mkForce "us";

  programs.fish.enable = true;
  programs.zsh.enable = true;

  users.users.syrkis.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    git
    gnupg
    pinentry-curses
    yubikey-manager
    openssh
    libfido2
    tailscale
    ghostty

    gcc.cc.lib
    zlib
  ];

  environment.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath runtimeLibs;
  };
}
