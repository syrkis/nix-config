# Nix Config

## Setup

To get running quickly on a new Linux machine run:

```shell
nix --extra-experimental-features 'nix-command flakes' run github:nix-community/home-manager -- switch --extra-experimental-features 'nix-command flakes' --flake github:syrkis/nix-config#linux --refresh
chezmoi init syrkis
chezmoi apply
```

For Mac stuff:

- `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
  install nix, and restart shell
- `git clone https://github.com/syrkis/nix-config.git ~/nix-config && cd ~/nix-config`
  clone my nix config
- Add your host to hosts, and include it in the flake.nix
- `sudo nix run nix-darwin --extra-experimental-features nix-command  --extra-experimental-features flakes -- switch --flake ~/nix-config#$(hostname -s)  --impure`
  install nix Darwin
- `sudo darwin-rebuild switch --flake ~/nix-config#$(hostname -s) --impure`
  apply config (hostname is for computer name)
- `sudo chsh -s $(which fish) $(whoami)`

## nice to haves

- `defaults write NSGlobalDomain ApplePersistence -bool false` disable
  persistence
