#!/bin/bash

set -euo pipefail

echo "🚀 Setting up your macOS system with Nix flakes..."

# Check if running on macOS
if [[ $(uname) != "Darwin" ]]; then
  echo "❌ This script is only for macOS."
  exit 1
fi

# Create ~/.config directory if it doesn't exist
if [ ! -d "$HOME/.config" ]; then
  echo "📁 Creating ~/.config directory..."
  mkdir -p "$HOME/.config"
fi

# Clone or update the repository
REPO_URL="https://github.com/verastalder/dotfiles.git"
TARGET_DIR="$HOME/.config/nixpkgs"

if [ -d "$TARGET_DIR" ]; then
  echo "🔄 Updating existing dotfiles repository..."
  cd "$TARGET_DIR"
  git pull
else
  echo "📥 Cloning dotfiles repository..."
  git clone "$REPO_URL" "$TARGET_DIR"
  cd "$TARGET_DIR"
fi

# Check if Nix is installed
if ! command -v nix-env &> /dev/null; then
  echo "📦 Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
  
  # Source nix profile
  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
fi

# Enable experimental features
echo "⚙️ Configuring Nix..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Ensure the git repo is clean before proceeding
if [ -n "$(git status --porcelain)" ]; then
  echo "⚠️ Git repository has uncommitted changes. Committing them now..."
  git add .
  git commit -m "Initial configuration setup"
fi

# Install nix-darwin
echo "🍎 Installing nix-darwin..."
if ! command -v darwin-rebuild &> /dev/null; then
  nix run github:lnl7/nix-darwin \
    -- switch --flake "$TARGET_DIR#$USER"
else
  echo "✅ nix-darwin is already installed."
fi

# Build and activate the configuration
echo "🔨 Building and activating the configuration..."
cd "$TARGET_DIR"
nix run github:lnl7/nix-darwin \
  -- switch --flake .#$USER

echo "✨ Setup complete! Your system is now configured with Nix flakes."
echo "🔄 To rebuild your system in the future, run: darwin-rebuild switch --flake ~/.config/nixpkgs#$USER" 