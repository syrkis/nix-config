{ ... }: {
  programs = {
    # Enable shell programs (required for aliases to work)
    bash.enable = true;
    zsh.enable = true;
    # fish.enable = true;

    # Modern shell prompt
    starship.enable = true;

    # Terminal multiplexer
    zellij.enable = true;

    # Better cat with syntax highlighting
    bat.enable = true;

    # Directory navigation
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    # Shell aliases
    bash.shellAliases = {
      cd = "z"; # Replace cd with zoxide
    };

    zsh.shellAliases = {
      cd = "z"; # Replace cd with zoxide
    };

    # fish.shellAliases = {
    # cd = "z"; # Replace cd with zoxide
    # cat = "bat";
    # less = "bat";
    # grep = "rg";
    # man = "tldr";
    # };

    # Modern ls replacement
    eza = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };

    # Fuzzy finder
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    # Better grep
    ripgrep.enable = true;
  };
}
