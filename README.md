# Dotfiles

My configuration files for Neovim, Fish shell, Tmux, Ghostty, and Claude Code, managed with GNU Stow.

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

## Installation (macOS, Linux, and WSL)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/leezhengjing/dotfiles.git ~/dotfiles
   ```
2. **Install GNU Stow:**
   - macOS: `brew install stow`
   - Ubuntu/WSL/Debian: `sudo apt update && sudo apt install stow`
3. **Run the installation script:**
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```
4. **Install Tmux plugins:** Tmux plugins are managed by [TPM](https://github.com/tmux-plugins/tpm) and are gitignored rather than vendored in this repo. Clone TPM, then open tmux and press `prefix + I` to fetch the rest:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

## Installation (Native Windows PowerShell)
*Use this if you want Neovim available in native Windows (cmd/PowerShell) outside of WSL.*

1. **Clone the repository** to your home directory:
   ```powershell
   git clone https://github.com/leezhengjing/dotfiles.git $HOME/dotfiles
   ```
2. **Run the installation script** (as Administrator):
   ```powershell
   cd $HOME/dotfiles
   ./install.ps1
   ```
