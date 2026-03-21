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
    fish = {
      enable = true;
      shellInit = ''
        set -gx EDITOR hx
        set -gx VISUAL hx
      '';
      interactiveShellInit = ''
        bind \\cz 'fg 2>/dev/null; commandline -f repaint'
      '';
      shellAliases = {
        cd = "z";
        eza = "eza --icons auto --git";
        la = "eza -a";
        ll = "eza -l";
        lla = "eza -la";
        ls = "eza";
        lt = "eza --tree";
      };
    };

    starship.enable = true;
    zellij.enable = true;
    bat.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd cd" ]; # Replace cd with z globally
    };
    # Shell aliases
    # bash.shellAliases = {
    # cd = "z";
    # };

    # eza = {
    # enable = true;
    # enableFishIntegration = true;
    # enableZshIntegration = true;
    # git = true;
    # icons = "auto";
    # };

    # fzf = {
    # enable = true;
    # enableFishIntegration = true;
    # enableZshIntegration = true;
    # };

    ripgrep.enable = true;
  };
}
