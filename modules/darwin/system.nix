{pkgs, ...}: {
  # Define a user
  users.users.verastalder = {
    name = "verastalder";
    home = "/Users/verastalder";
    shell = pkgs.fish;
  };

  # Add fish to system shells
  environment.shells = with pkgs; [fish];
  programs.fish.enable = true;

  # Add system packages (from the current darwin-configuration.nix)
  environment.systemPackages = with pkgs; [
    alejandra
  ];

  # Enable the nix daemon
  nix.useDaemon = true;

  # Set the default configuration path
  environment.darwinConfig = "$HOME/.config/nixpkgs/flake.nix";
}
