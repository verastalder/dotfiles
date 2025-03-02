# Vera's Dotfiles

This repository contains my personal dotfiles, managed with [Nix](https://nixos.org/), [nix-darwin](https://github.com/LnL7/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager) using the Nix Flakes approach.

## Features

- Declarative macOS system configuration with nix-darwin
- User-level configuration with Home Manager
- Homebrew integration for managing macOS applications
- Fish shell configuration with plugins and themes
- Git configuration and defaults
- macOS system preferences and defaults

## Installation

### One-line install (recommended)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/verastalder/dotfiles/main/install.sh)"
```

### Manual Installation

1. Install Nix:
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
   ```

2. Enable flakes:
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
   ```

3. Clone this repository:
   ```bash
   git clone https://github.com/verastalder/dotfiles.git ~/.config/nixpkgs
   ```

4. Build and activate the configuration:
   ```bash
   cd ~/.config/nixpkgs
   # Commit any local changes first to keep the repository clean
   git add .
   git commit -m "Initial configuration"
   # Then build the configuration
   nix run github:lnl7/nix-darwin -- switch --flake .#verastalder
   ```

## Updating

To update your system after making changes to the configuration:

```bash
# Always commit your changes first
git add .
git commit -m "Update configuration"
# Then rebuild
darwin-rebuild switch --flake ~/.config/nixpkgs#verastalder
```

## Structure

```
.
├── flake.nix              # Flake definition (inputs, outputs)
├── modules/               # Configuration modules
│   ├── darwin/            # macOS system configuration
│   │   ├── default.nix    # Main darwin configuration
│   │   ├── homebrew.nix   # Homebrew packages and casks
│   │   ├── macos.nix      # macOS defaults
│   │   └── system.nix     # System-level configuration
│   └── home/              # User home configuration
│       ├── default.nix    # Main home-manager config
│       ├── git/           # Git configuration
│       └── shell.nix      # Shell configuration
└── install.sh             # Installation script
```

## Recent Fixes

- Fixed deprecated nix-darwin configuration options
- Replaced `nix.settings.auto-optimise-store` with `nix.optimise.automatic`
- Removed deprecated `services.nix-daemon.enable` option
- Removed deprecated `nix.useDaemon` option
- Using pure builds by ensuring the Git repository is clean before building

## Goals

- [x] Installs Command Line Tools silently
- [x] Installs Nix
- [x] Installs Nix-Darwin
- [x] Installs Homebrew
- [x] Clones this repo to the local machine
- [x] Initiates the first `darwin-rebuild` to switch configurations
- [x] Uses Nix Flakes for reproducible builds

## Inspiration

Heavily inspired by:

- https://github.com/matchai/dotfiles
- https://github.com/okkdev/dotnix
- https://github.com/GiyoMoon/nix
- https://github.com/TheOptimist/systemosaurus

## License

This project is licensed under the MIT License - see the LICENSE file for details.
