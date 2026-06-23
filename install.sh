#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles..."

# Sync .vimrc to home directory
echo "Syncing .vimrc..."
rsync -av "$DOTFILES_DIR/.vimrc" "$HOME/"

# Sync .zsh directory to home directory
echo "Syncing .zsh/..."
rsync -av "$DOTFILES_DIR/.zsh/" "$HOME/.zsh/"

# Sync .zshrc to home directory
echo "Syncing .zshrc..."
rsync -av "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Sync VS Code settings
echo "Syncing VS Code settings..."
mkdir -p "$HOME/Library/Application Support/Code/User"
rsync -av "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

# Setup ghostty config
echo "Syncing ghostty config..."
mkdir -p "$HOME/.config/ghostty"
rsync -av "$DOTFILES_DIR/ghostty/" "$HOME/.config/ghostty/"

# Setup global gitignore
echo "Syncing global gitignore..."
rsync -av "$DOTFILES_DIR/.gitignore" "$HOME/.gitignore"
git config --global core.excludesfile "$HOME/.gitignore"

echo ""
echo "========================================================================"
echo "✅ Dotfiles installed successfully!"
echo "========================================================================"
