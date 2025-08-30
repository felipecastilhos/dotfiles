# Dotfiles

Personal configuration files for development environment setup.

## Setup

### Prerequisites

Install GNU Stow:

```bash
# Arch/Manjaro
sudo pacman -S stow

# Ubuntu/Debian
sudo apt install stow

# macOS
brew install stow
```

### Installation

1. Clone this repository:
```bash
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
```

2. Use GNU Stow to symlink configurations:
```bash
# Install all configurations
stow */

# Or install specific configurations
stow nvim
stow zshrc
stow bashrc
stow wezterm
```

3. Restart your terminal or source your shell configuration.

## What is this?

This repository contains my personal dotfiles organized for use with GNU Stow. Each directory represents a different program's configuration that gets symlinked to the appropriate location in your home directory when you run `stow`.

Stow creates symbolic links from this repository to your home directory, keeping your configurations version controlled while maintaining the standard file locations that programs expect.
