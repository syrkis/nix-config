{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # Rust toolchain
    # inputs.fenix.packages.${pkgs.system}.stable.toolchain

    # Development tools
    typescript
    dprint
    ripgrep
    passage
    tokei
    bottom
    # dark-mode-notify
    futhark
    kitty-img
    rage
    graphviz
    # calendula
    # tailscale
    # epy
    rumdl
    bk
    bun
    zk
    stack
    marksman
    yaml-language-server
    nodejs_24
    zig
    # clojure
    lazygit
    nixd
    nil
    # servo
    nixpkgs-fmt
    nixfmt-classic
    # biome
    # steel
    # swig4
    # cmake
    docker

    # CLI utilities
    # yazi
    ripgrep
    # fd
    # fzf
    eza
    zoxide
    sd
    # wget
    curl
    # htop
    btop
    tealdeer
    croc
    just
    asciinema
    watch

    # Media & Graphics
    # ffmpeg
    # imagemagick
    # ghostscript
    # blender

    # Documents & Publishing
    pandoc
    typst
    # ghostty-bin
    typstyle
    # hledger
    # hledger-ui
    # newcomputermodern

    # Security & Privacy
    gnupg
    # pinentry_mac # Better GPG pinentry for macOS
    (pass.withExtensions (ps: [ ps.pass-otp ]))

    # Communication
    # himalaya

    # System utilities
    starship
    bat
    # ollama
    yazi
    dust
    procs

    # Specialized tools
    # uiua
    # uv
    nushell
    # alacritty
    tex-fmt
    texlive.combined.scheme-full
    texlab
    # ruff
    # ty

    # git stuff
    gh # GitHub CLI
    # git-lfs # Large file support

    # other
    rclone
    # duti
    # awscli2
    lean4
    direnv
    wakapi
    wakatime-cli
    # colima
    docker
    # tesseract
    harper
    # tinymist
    # helix
    imagemagick

    deno

  ];
}
