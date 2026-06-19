# modules/nixos.nix
{ pkgs, ... }:
{
  services.pcscd.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
    libu2f-host
  ];

  console.keyMap = "us";
  services.xserver.xkb.layout = "us";

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
