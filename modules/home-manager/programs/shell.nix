{ ... }:
{
  # PATH entries (top-level, not under programs)
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  programs = {
    bash.enable = true;
    zsh.enable = true;
    # fish.enable = true;

    starship.enable = true;
    zellij.enable = true;
    bat.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    # Shell aliases
    bash.shellAliases = {
      cd = "z";
    };

    zsh.shellAliases = {
      cd = "z";
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    ripgrep.enable = true;
  };
}
