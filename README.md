# Dotfiles

This repository contains my personal dotfiles and configuration files used across my Mac setups.

## What's Included

- **Zsh**: Custom `.zshrc` and modular `.zsh/` setup (aliases, completions, theme).
- **Vim**: Basic `.vimrc` configuration.
- **Ghostty**: Terminal configuration.
- **VS Code**: Synchronized `settings.json`.
- **Git**: Global `.gitignore` configuration.
- **Homebrew**: `Brewfile` for restoring installed packages.

## Installation

> ⚠️ **Warning:** Running this script will overwrite existing configuration files in your home directory without creating backups.

Run the installation script to sync the files to your home directory:

```bash
./install.sh
```

### Installing Packages (macOS)

To restore all CLI tools and applications via Homebrew, run:

```bash
brew bundle
```

## License

This repository is licensed under the [MIT License](LICENSE).
