{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # Rust toolchain
    inputs.fenix.packages.${pkgs.system}.stable.toolchain

    # Development tools
    typescript
    ripgrep
    nodejs_22
    clojure
    uv
    nixd
    nil
    nixpkgs-fmt
    nixfmt-classic
    biome
    swig4
    cmake
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
    tealdeer
    croc
    just
    # hurl
    # nmap
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
    himalaya

    # System utilities
    starship
    bat
    # ollama
    # yazi
    dust
    procs

    # Specialized tools
    uiua
    nushell
    ruff
    ty

    # git stuff
    gh # GitHub CLI
    git-lfs # Large file support
    # glab # GitLab CLI (if you use GitLab)

    # other
    rclone
    duti
    # R
    awscli2
    lean4
    netlify-cli
    direnv
    # zed-editor
    gemini-cli
    wakapi
    colima
    docker
    tesseract
  ];
}
