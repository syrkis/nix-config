# modules/nixos.nix
{ pkgs, lib, ... }:
{
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
  ];
}
