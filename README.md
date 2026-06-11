# Dotfiles

My configuration files for Neovim, Fish shell, and Tmux, managed with GNU Stow.

## How it works
This repository uses **GNU Stow** to manage symlinks. The folder structure inside each "package" (like `nvim/`, `fish/`, or `tmux/`) mimics the structure of your home directory. 

When you run `stow nvim`, it creates a symlink from `~/.config/nvim` pointing to `~/dotfiles/nvim/.config/nvim`.

## Usage
**You can edit your config files in either location!** Since they are symlinked, changes in `~/.config/nvim` are actually written to `~/dotfiles/nvim/.config/nvim`. 

To save changes to GitHub:
```bash
cd ~/dotfiles
git add .
git commit -m "update config"
git push
```

## Installation (macOS/Linux)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/leezhengjing/dotfiles.git ~/dotfiles
   ```
2. **Install GNU Stow:**
   ```bash
   brew install stow
   ```
3. **Apply configurations:**
   ```bash
   cd ~/dotfiles
   stow nvim
   stow fish
   stow tmux
   ```

## Installation (Windows)

1. **Clone the repository** to your home directory:
   ```powershell
   git clone https://github.com/leezhengjing/dotfiles.git $HOME/dotfiles
   ```
2. **Run the installation script** (as Administrator to allow symlinks):
   ```powershell
   cd $HOME/dotfiles
   ./install.ps1
   ```
   *Note: This script currently only sets up Neovim on Windows.*
