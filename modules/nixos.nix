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

  environment.systemPackages = with pkgs; [
    git
    gnupg
    pinentry
    yubikey-manager
    openssh
    libfido2
  ];
}
