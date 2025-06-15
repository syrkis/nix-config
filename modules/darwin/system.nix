{ pkgs, ... }: {
  # System configuration
  # primaryUser is set in each host configuration
  system.stateVersion = 4;

  # Shell configuration
  programs.zsh.enable = true;
  programs.fish.enable = true;
  environment.shells = with pkgs; [ zsh bash fish nushell ];

  # Nix configuration
  nix.enable = false;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
    allow-dirty = true
  '';

  # System packages and paths
  environment = {
    systemPackages = with pkgs; [ coreutils nushell ];
    systemPath = [ "/opt/homebrew/bin/" ];
    pathsToLink = [ "/Applications" ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      GIT_EDITOR = "nvim";
    };
  };

  # IDs configuration
  ids.gids.nixbld = 350;

  # sudo via finger
  security.pam.services.sudo_local.touchIdAuth = true;

  # Enhance modules/darwin/system.nix
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      tilesize = 48;
      persistent-apps = [
        { app = "System/Applications/Mail.app"; }
        { app = "/Applications/Zotero.app"; }
        { app = "/Applications/Zen.app"; }
        { app = "/Applications/Zed.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/System/Applications/System Settings.app"; }
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXDefaultSearchScope = "SCcf"; # Search current folder
    };

    NSGlobalDomain = {
      # Faster key repeat
      KeyRepeat = 2;
      InitialKeyRepeat = 15;

      # Show file extensions
      AppleShowAllExtensions = true;

      # Disable auto-correct
      NSAutomaticSpellingCorrectionEnabled = false;

      # Set dark mode
      AppleInterfaceStyle = "Dark";

      # Auto-hide menu bar (optional, looks clean with dark mode)
      _HIHideMenuBar = true; # set to true to auto-hide

      # Trackpad
      "com.apple.trackpad.enableSecondaryClick" = true;
      "com.apple.trackpad.scaling" = 3.0;

      # Disable system sounds
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.sound.beep.volume" = 0.0;

    };

    # Screenshot settings
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
