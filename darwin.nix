{ config, pkgs, ... }:

let mainUser = "quest1onmark";
in {
  imports = [ ./darwin <home-manager/nix-darwin> ];

  users.users.${mainUser} = {
    home = "/Users/${mainUser}";
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  
  home-manager = {
    users.${mainUser} = import ./home;
    useGlobalPkgs = true;
    useUserPackages = false;
  };

  services.nix-daemon.enable = true;
  nix.useDaemon = true;

  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
