{ pkgs, ... }:
{
  system.stateVersion = 4;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment = {
    shells = with pkgs; [
      zsh
      bash
      fish
    ];

    systemPackages = with pkgs; [
      coreutils
    ];

    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
      GIT_EDITOR = "hx";
    };
  };

  nix.enable = false;

  determinateNix = {
    enable = true;

    customSettings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "determinate.cachix.org-1:yiS82z6lVEjdGQphjQxBb22c7lbqhYrxvlrMYmCB8hc="
      ];

      substituters = [
        "https://cache.nixos.org/"
        "https://determinate.cachix.org"
      ];

      trusted-users = [
        "root"
        "nobr"
      ];

      builders = [
        "ssh-ng://root@95.216.155.40 x86_64-linux - 4 1"
      ];

      builders-use-substitutes = true;

      allow-dirty = true;
    };
  };

  documentation.enable = false;

  ids.gids.nixbld = 350;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      tilesize = 48;
      persistent-apps = [
        { app = "System/Applications/Mail.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/Applications/Zen.app"; }
        { app = "/Applications/Zotero.app"; }
        { app = "/Applications/Readest.app"; }
        { app = "/Users/nobr/Applications/Home Manager Apps/sioyek.app"; }
        { app = "/Applications/Beeper Desktop.app"; }
        { app = "/System/Applications/System Settings.app"; }
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXDefaultSearchScope = "SCcf";
    };

    NSGlobalDomain = {
      KeyRepeat = 1;
      InitialKeyRepeat = 10;
      AppleShowAllExtensions = true;
      NSAutomaticSpellingCorrectionEnabled = false;
      AppleInterfaceStyle = "Dark";
      _HIHideMenuBar = true;
      "com.apple.trackpad.enableSecondaryClick" = true;
      "com.apple.trackpad.scaling" = 3.0;
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.sound.beep.volume" = 0.0;
    };

    screencapture = {
      location = "~/Pictures/Screenshots";
      type = "png";
      target = "file";
    };

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };
}
