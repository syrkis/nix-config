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
      "tinymist"
      "ollama"
    ];

    casks = [
      "brave-browser"
      "slack"
      "zen-browser"
      "unity-hub"
      "logseq"
      "skim"
      "obs"
      "vagrant"
      "ghostty"
      "zotero"
      "fuse-t"
      "fuse-t-sshfs"
      "readest"
      "zed"
    ];
  };
}
