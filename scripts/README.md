# Dotfiles Scripts

This directory contains utility scripts to manage your dotfiles configuration using GNU Stow.

## Scripts Overview

### `dotbkper.sh` - Dotfiles Backup & Package

Moves configuration files/directories from your system to the dotfiles repository and automatically stows them back using GNU Stow.

**Usage:**
```bash
./dotbkper.sh <package> <path> [path2] [path3] ...
```

**Examples:**
```bash
./dotbkper.sh nvim ~/.config/nvim/init.lua
./dotbkper.sh nvim ~/.config/nvim/
./dotbkper.sh zsh ~/.zshrc ~/.zprofile
```

**What it does:**
1. Takes a package name and one or more file/directory paths
2. Moves the specified paths to `~/dotfiles/<package>/` maintaining directory structure
3. Automatically runs `stow` to create symlinks back to their original locations

### `dotsync.sh` - Dotfiles Sync

Commits and pushes any changes in your dotfiles repository to Git.

**Usage:**
```bash
./dotsync.sh
```

**What it does:**
1. Changes to the `~/dotfiles` directory
2. Checks for uncommitted changes
3. If changes exist: adds all files, commits with timestamp, and pushes to remote
4. If no changes: displays a confirmation message

### `dotstatus.sh` - Dotfiles Status

Checks if there are any uncommitted changes in your dotfiles repository.

**Usage:**
```bash
./dotstatus.sh
```

**What it does:**
1. Changes to the `~/dotfiles` directory
2. Checks Git status
3. Displays either uncommitted changes or confirmation that everything is up to date

## Prerequisites

- **GNU Stow**: Required for `dotbkper.sh` to create symlinks
- **Git**: Required for `dotsync.sh` and `dotstatus.sh`
- **Zsh**: All scripts use zsh as the shell

## Workflow

1. Use `dotbkper.sh` to move configuration files into your dotfiles repository
2. Use `dotstatus.sh` to check what changes need to be committed
3. Use `dotsync.sh` to commit and push changes to your remote repository