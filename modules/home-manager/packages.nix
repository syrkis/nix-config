{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # Rust toolchain
    inputs.fenix.packages.${pkgs.system}.stable.toolchain

    # Development tools
    typescript
    ripgrep
    nodejs_24
    # clojure
    nixd
    nil
    nixpkgs-fmt
    nixfmt-classic
    biome
    # swig4
    # cmake
    docker

    # CLI utilities
    ripgrep
    fd
    fzf
    eza
    zoxide
    sd
    wget
    curl
    htop
    btop
    tealdeer
    croc
    # just
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
    typstyle
    # hledger
    # hledger-ui
    # newcomputermodern

    # Security & Privacy
    gnupg
    pinentry_mac # Better GPG pinentry for macOS
    (pass.withExtensions (ps: [ ps.pass-otp ]))

    # Communication
    # himalaya

    # System utilities
    starship
    bat
    # ollama
    # yazi
    dust
    procs

    # Specialized tools
    uiua
    uv
    nushell
    ruff
    ty

    # git stuff
    gh # GitHub CLI
    git-lfs # Large file support

    # other
    rclone
    duti
    awscli2
    lean4
    netlify-cli
    direnv
    wakapi
    colima
    docker
    tesseract
    harper
    tinymist
    taskwarrior3
    helix
    imagemagick
    julia-bin
  ];
}
