{ ... }:
{
  # Developer-friendly macOS defaults
  system.defaults = {
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15; # lower is faster
      KeyRepeat = 2;         # lower is faster
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      "com.apple.trackpad.scaling" = 2.0;  # Trackpad tracking speed

    };

    dock = {
      autohide = true;
      show-recents = false;
      mru-spaces = false; # don’t reorder spaces
      tilesize = 56;
      minimize-to-application = true;
    };

    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      FXPreferredViewStyle = "Nlsv"; # list view
      FXEnableExtensionChangeWarning = false;
      NewWindowTarget = "Home"; # Home
    };

    screencapture = {
      location = "~/Downloads/Screenshots";
      type = "png";
    };

    trackpad = {
      Clicking = true;            # tap to click
      TrackpadThreeFingerDrag = true;
    };
    
  };

  # Apply defaults immediately for Dock/Finder when switching
  system.activationScripts.postActivation.text = ''
    /usr/bin/killall Dock 2>/dev/null || true
    /usr/bin/killall Finder 2>/dev/null || true
  '';
}
