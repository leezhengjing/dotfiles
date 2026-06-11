#!/bin/bash

# Dotfiles installation script for macOS/Linux/WSL
# Uses GNU Stow to manage symlinks

DOTFILES_DIR="$HOME/dotfiles"

# Ensure GNU Stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed."
    echo "Please install it using: brew install stow (macOS) or sudo apt install stow (Ubuntu/WSL)"
    exit 1
fi

cd "$DOTFILES_DIR"

echo "Applying configurations..."

# Create ~/.config if it doesn't exist
mkdir -p "$HOME/.config"

# Stow packages
stow nvim
stow fish
stow tmux

echo "Done! Symlinks created successfully."
