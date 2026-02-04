# modules/home-manager/programs/git.nix
{ ... }:
{
  programs.git = {
    enable = true;

    signing = {
      key = null;
      signByDefault = false;
      format = "ssh";
    };

    settings = {
      user = {
        name = "Noah Syrkis";
        email = "noah@syrkis.com";
      };

      core = {
        editor = "nvim";
        excludesfile = "~/.config/git/ignore";
        autocrlf = "input";
        ignorecase = false;
      };

      credential = {
        helper = "cache --timeout=28800"; # 8 hours
      };

      alias = {
        st = "status --short";
        # …
      };

      url."git@github.com:" = {
        insteadOf = [
          "https://github.com/"
          "http://github.com/"
        ];
      };

      # move anything that lived under extraConfig here as well
    };

    ignores = [
      ".DS_Store"
      ".DS_Store?"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      "*.swp"
      "*.swo"
      "*~"
      ".vscode/"
      ".env"
      "node_modules/"
      "__pycache__/"
      "*.pyc"
      "result"
      "result-*"
      ".direnv/"
    ];
  };
}
