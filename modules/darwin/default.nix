{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./system.nix
    ./homebrew.nix # Assuming we'll create this from the existing homebrew.nix
    ./macos.nix # Assuming we'll create this from the existing macos.nix
  ];

  # These are the core settings that should be in the default darwin module
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    # Add ability to install packages for both Intel and ARM macs if needed
    extraOptions =
      lib.optionalString (pkgs.system == "aarch64-darwin") ''
        extra-platforms = aarch64-darwin x86_64-darwin
      ''
      + lib.optionalString (pkgs.system == "x86_64-darwin") ''
        extra-platforms = x86_64-darwin aarch64-darwin
      '';
  };

  # Enable nix-darwin services
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 4;
}
