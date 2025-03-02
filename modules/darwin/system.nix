{pkgs, ...}: {
  # Define a user with Fish as the default shell
  users.users.verastalder = {
    name = "verastalder";
    home = "/Users/verastalder";
    shell = pkgs.fish;
  };

  # Enable Fish shell system-wide
  environment.shells = with pkgs; [fish];
  programs.fish.enable = true;

  # Add system packages (from the current darwin-configuration.nix)
  environment.systemPackages = with pkgs; [
    alejandra
  ];

  # Set the default configuration path
  environment.darwinConfig = "$HOME/.config/nixpkgs/flake.nix";
}
