{pkgs, ...}: {
  # Define a user
  users.users.verastalder = {
    name = "verastalder";
    home = "/Users/verastalder";
    shell = pkgs.fish;
  };

  # Add fish to system shells and configure as default
  environment.shells = with pkgs; [fish];
  programs.fish.enable = true;

  # Set login shell properly in nix-darwin
  system.defaults.loginShell = "${pkgs.fish}/bin/fish";

  # Add system packages (from the current darwin-configuration.nix)
  environment.systemPackages = with pkgs; [
    alejandra
  ];

  # Set the default configuration path
  environment.darwinConfig = "$HOME/.config/nixpkgs/flake.nix";
}
