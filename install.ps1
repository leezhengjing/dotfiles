# Windows Installation Script for Dotfiles

$nvimConfigPath = "$HOME\AppData\Local\nvim"
$dotfilesNvimPath = "$HOME\dotfiles\nvim\.config\nvim"

if (Test-Path $nvimConfigPath) {
    Write-Host "Backing up existing Neovim config to $nvimConfigPath.bak"
    Rename-Item -Path $nvimConfigPath -NewName "$nvimConfigPath.bak" -ErrorAction SilentlyContinue
}

Write-Host "Creating symlink for Neovim..."
New-Item -ItemType SymbolicLink -Path $nvimConfigPath -Target $dotfilesNvimPath

$gitConfigPath = "$HOME\.gitconfig"
$dotfilesGitPath = "$HOME\dotfiles\git\.gitconfig"
if (Test-Path $gitConfigPath) {
    Write-Host "Backing up existing .gitconfig to $gitConfigPath.bak"
    Rename-Item -Path $gitConfigPath -NewName "$gitConfigPath.bak" -ErrorAction SilentlyContinue
}
Write-Host "Creating symlink for Git config..."
New-Item -ItemType SymbolicLink -Path $gitConfigPath -Target $dotfilesGitPath

Write-Host "Done!"
