# modules/nixos.nix
{ pkgs, ... }:
{
  services.pcscd.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
    libu2f-host
  ];

  programs.fish.enable = true;
  programs.zsh.enable = true;

  users.users.nobr.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    git
    gnupg
    pinentry-curses
    yubikey-manager
    openssh
    libfido2
  ];
}
