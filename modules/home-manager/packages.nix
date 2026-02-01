{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Rust toolchain
    # inputs.fenix.packages.${pkgs.system}.stable.toolchai
    typescript
    dprint
    sipexer
    dprint
    biome
    tuios
    ffmpeg
    code-minimap
    codex
    ripgrep
    jujutsu
    passage
    tokei
    bottom
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
    deno

  ];
}
