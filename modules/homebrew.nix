{ inputs, ... }:
{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      # Keep updates pinned/reviewable via flake.lock instead of `brew update`.
      autoUpdate = false;
      # Upgrade installed brews/casks to the versions from the pinned taps on rebuild.
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      "pkg-config"
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
      # "hammerspoon"
      # "skim"
      # "obsidian"
      "whatsapp"
      "obs"
      # "zotero"
      # "fuse-t"
      # "anki"
      # "openra"
      # "tailscale-app"
      # "fuse-t-sshfs"
      "readest"
      # "zed"
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
    mutableTaps = false;
  };
}
