# Dotfiles

My configuration files for Neovim and Fish shell, managed with GNU Stow.

## Installation (macOS/Linux)

1. Clone the repository:
   ```bash
   git clone https://github.com/leezhengjing/dotfiles.git ~/dotfiles
   ```
2. Install GNU Stow:
   ```bash
   brew install stow
   ```
3. Apply configurations:
   ```bash
   cd ~/dotfiles
   stow nvim
   stow fish
   ```

## Installation (Windows)

1. Clone the repository to your home directory:
   ```powershell
   git clone https://github.com/leezhengjing/dotfiles.git $HOME/dotfiles
   ```
2. Run the installation script (as Administrator to allow symlinks):
   ```powershell
   cd $HOME/dotfiles
   ./install.ps1
   ```
   *Note: This script currently only sets up Neovim on Windows.*
