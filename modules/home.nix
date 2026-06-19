{ pkgs, lib, ... }:
{
  targets.darwin.currentHostDefaults = lib.mkIf pkgs.stdenv.isDarwin {
    "com.apple.controlcenter".BatteryShowPercentage = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  home.packages = with pkgs; [
    asciinema
    # kitty
    gnupg
    # pihole # only on linux
    # vault
    # lsp-ai
    # llama-cpp
    # wrangler
    tesseract
    (pkgs.aerc.override {
      notmuch = pkgs.notmuch.override {
        withEmacs = false;
      };
    })
    khard
    # emacs31
    rumdl
    gifsicle
    simple-completion-language-server
    # ollama
    mdfried
    nushell
    # vllm
    chawan
    ty
    uiua
    ruff
    uv
    # pinentry-mac
    yubikey-manager
    rustup
    # zotero
    tailscale
    openssh
    libfido2
    hut
    gopass
    viu
    libwebp
    astro-language-server
    autoconf
    automake
    syncthing
    bat
    helix
    timg
    bk
    bottom
    google-cloud-sdk
    helix
    btop
    bun
    chafa
    chezmoi
    # ghostty
    # codex
    # opencode
    # clang
    code-minimap
    colima
    # croc
    curl
    devenv
    # direnv
    docker
    # dprint
    # dust
    # elan
    eza
    ffmpeg
    fish
    # futhark
    fzf
    gnupg
    glow
    go
    graphviz
    harper
    himalaya
    imagemagick
    just
    jujutsu
    kitty-img
    # lazygit
    # libcxx
    # libtool
    marksman
    # mpv
    nil
    nixd
    nixfmt
    nixpkgs-fmt
    nodejs_24
    pandoc
    # passage
    # (pass.withExtensions (ps: [ ps.pass-otp ]))
    pkg-config
    postgresql_18
    postgres-language-server
    # rage
    rclone
    ripgrep
    # rumdl
    # sd
    sioyek
    sipexer
    sqlfluff
    # stack
    starship
    tailscale
    tealdeer
    tex-fmt
    texlab
    texlive.combined.scheme-full
    # tokei
    # tuios
    typst
    typstyle
    # typescript
    # utm
    wakapi
    wakatime-cli
    watch
    watchexec
    wget
    yaml-language-server
    yazi
    zig
    zk
  ];

  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    enableScDaemon = true;
    enableSshSupport = false;
  };
  services.gpg-agent.pinentry.package = pkgs.lib.mkIf pkgs.stdenv.isDarwin pkgs.pinentry_mac;

  programs.bash.enable = true;
  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(zoxide init zsh --cmd cd)"
    '';
  };

  programs.fish = {
    enable = true;

    shellInit = ''
      printf '\e[?2031h'
      set -gx EDITOR hx
      set -gx VISUAL hx
    '';

    interactiveShellInit = ''
      zoxide init fish | source
      bind \cz 'fg 2>/dev/null; commandline -f repaint'
    '';

    shellAliases = {
      eza = "eza --icons auto --git";
      la = "eza -a";
      ll = "eza -l";
      lla = "eza -la";
      ls = "eza";
      lt = "eza --tree";
      # optional transition alias
      pass = "gopass";
      cd = "z";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = false;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

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
        editor = "hx";
        excludesfile = "~/.config/git/ignore";
        autocrlf = "input";
        ignorecase = false;
      };

      credential.helper = "cache --timeout=28800";

      alias = {
        st = "status --short";
      };
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

  programs.starship.enable = true;
  programs.zellij.enable = true;
  programs.bat.enable = true;

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
