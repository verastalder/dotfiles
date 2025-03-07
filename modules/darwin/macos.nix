{...}: {
  system.defaults = {
    LaunchServices = {
      LSQuarantine = false;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleKeyboardUIMode = 3;
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Automatic";
      AppleTemperatureUnit = "Celsius";
      InitialKeyRepeat = 15;
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDisableAutomaticTermination = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSTableViewDefaultSizeMode = 1;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };

    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = true;
    };

    alf = {
      globalstate = 1;
      stealthenabled = 1;
    };

    dock = {
      # TODO: Fix these
      # autohide-delay = "0";
      # autohide-time-modifier = "1";
      autohide = true;
      orientation = "left";
      showhidden = true;
      show-recents = false;
      static-only = true;
      tilesize = 32;
      launchanim = false;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      CreateDesktop = false;
    };

    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };

    screencapture = {
      location = "/Users/verastalder/screenshots";
    };

    smb = {
      NetBIOSName = "devenv";
      ServerDescription = "devenv";
    };
  };
}
