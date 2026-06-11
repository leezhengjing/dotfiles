# Windows Installation Script for Dotfiles

$nvimConfigPath = "$HOME\AppData\Local\nvim"
$dotfilesNvimPath = "$HOME\dotfiles\nvim\.config\nvim"

if (Test-Path $nvimConfigPath) {
    Write-Host "Backing up existing Neovim config to $nvimConfigPath.bak"
    Rename-Item -Path $nvimConfigPath -NewName "$nvimConfigPath.bak" -ErrorAction SilentlyContinue
}

Write-Host "Creating symlink for Neovim..."
New-Item -ItemType SymbolicLink -Path $nvimConfigPath -Target $dotfilesNvimPath

Write-Host "Done!"
