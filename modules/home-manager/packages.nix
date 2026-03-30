{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # inputs.fenix.packages.${pkgs.system}.stable.toolchai
    typescript
    # qutebrowser
    # tabnine
    # iamb
    fzf
    # pi-coding-agent
    dprint
    wget
    # opencode
    # jellyfin
    autoconf
    chafa # figs in terminal
    sqlfluff
    mpv # video in terminal
    postgres-language-server
    # postgres-language-serve
    devenv
    chezmoi
    automake
    sioyek
    # openra
    # logseq
    aichat
    glow
    astro-language-server
    libtool
    yazi
    # obsidian
    go
    himalaya
    # mullvad
    # mullvad-browser
    # aerc
    pkg-config
    watchexec
    sipexer
    # anki-bin
    # dprint
    # llpp
    biome
    # poppler
    # racket
    tuios
    ffmpeg
    code-minimap
    # codex
    ripgrep
    jujutsu
    passage
    tokei
    bottom
    # mupdf
    # zathura
    libcxx
    futhark
    kitty-img
    rage
    fish
    graphviz
    rumdl
    bk
    bun
    zk
    stack
    marksman
    yaml-language-server
    nodejs_24
    zig
    lazygit
    nixd
    nil
    nixpkgs-fmt
    nixfmt
    colima
    docker
    ripgrep
    eza
    zoxide
    sd
    curl
    btop
    tealdeer
    croc
    just
    asciinema
    watch
    pandoc
    typst
    typstyle
    gnupg
    (pass.withExtensions (ps: [ ps.pass-otp ]))
    starship
    bat
    dust
    tex-fmt
    texlive.combined.scheme-full
    texlab
    rclone
    elan
    clang
    direnv
    wakapi
    wakatime-cli
    harper
    # tinymist
    imagemagick
    # postgresql_18
    # postgresql18Packages.postgis
    # osm2pgsql
    # deno

  ];
}
