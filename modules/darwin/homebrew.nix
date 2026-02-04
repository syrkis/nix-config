{ ... }:
{
  # Homebrew configuration - works with nix-homebrew
  homebrew = {
    # global.brewfile = false;

    enable = true; # This is required for nix-darwin to manage packages!
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    brews = [
      "pkg-config"
      "watch"
      "bfg"
      "fswatch"
      "pdf2svg"
      "cmake"
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
      # "ollama"
    ];

    casks = [
      "protonvpn"
      "ungoogled-chromium"
      "hammerspoon"
      "skim"
      "obs"
      "zotero"
      "fuse-t"
      "fuse-t-sshfs"
      "readest"
      "racket"
      "beeper"
      "discord"
      "brave-browser"
    ];
  };
}
