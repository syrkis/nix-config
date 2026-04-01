{ inputs, ... }:
{
  homebrew = {
    enable = true;
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
    ];

    casks = [
      "protonvpn"
      "ungoogled-chromium"
      "signal"
      "hammerspoon"
      "skim"
      "obsidian"
      "whatsapp"
      "obs"
      "zotero"
      "fuse-t"
      "anki"
      "openra"
      "tailscale"
      "fuse-t-sshfs"
      "readest"
      "zen"
      "beeper"
      "discord"
      "brave-browser"
    ];
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "nobr";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "macos-fuse-t/homebrew-cask" = inputs.homebrew-fuse-t;
    };

    autoMigrate = true;
    mutableTaps = true;
  };
}