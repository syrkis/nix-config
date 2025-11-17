{ ... }: {
  # Homebrew configuration - works with nix-homebrew
  homebrew = {
    enable = true; # This is required for nix-darwin to manage packages!
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    brews = [
      "pkg-config"
      "watch"
      "bfg"
      "fswatch"
      "pdf2svg"
      "cmake"
      "gettext"
      "gmp"
      "hiredis"
      "jpeg-turbo"
      "jsoncpp"
      "leveldb"
      "libogg"
      "libpng"
      "libvorbis"
      "luajit"
      "zstd"
      "gettext"
      "openssl"
      "ollama"
    ];

    casks = [
      "protonvpn"
      "basictex"
      "ungoogled-chromium"
      "hammerspoon"
      "amethyst"
      "unity-hub"
      "logseq"
      "skim"
      "obs"
      # "ghostty"
      "zotero"
      "fuse-t"
      "fuse-t-sshfs"
      "readest"
      "zed"
      "beeper"
      "discord"
      "brave-browser"
    ];
  };
}
