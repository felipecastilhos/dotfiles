#!/usr/bin/env zsh

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <package> <path> [path2] [path3] ..."
    echo "Example: $0 nvim ~/.config/nvim/init.lua"
    echo "Example: $0 nvim ~/.config/nvim/"
    echo "Example: $0 zsh ~/.zshrc ~/.zprofile"
    exit 1
fi

package="$1"
shift  # Remove package from arguments, leaving only paths

dotfiles_dir="$HOME/dotfiles"

# Function to backup a single path (file or directory)
backup_path() {
    local path="$1"
    
    if [[ ! -e "$path" ]]; then
        echo "Warning: '$path' does not exist, skipping..."
        return 1
    fi
    
    # Calculate relative path from HOME
    local relative_path="${path#$HOME/}"
    
    # Remove trailing slash for consistency
    relative_path="${relative_path%/}"
    
    # Create target path maintaining directory structure
    local target_path="$dotfiles_dir/$package/$relative_path"
    
    echo "Moving $path to package: $package"
    echo "Target: $target_path"
    
    if [[ -d "$path" ]]; then
        # Handle directory
        mkdir -p "$(dirname "$target_path")"
        cp -r "$path" "$(dirname "$target_path")/"
        rm -rf "$path"
    else
        # Handle file
        mkdir -p "$(dirname "$target_path")"
        mv "$path" "$target_path"
    fi
}

# Process all paths
for path in "$@"; do
    backup_path "$path"
done

# Stow the package once at the end
echo "Stowing package: $package"
stow -d "$dotfiles_dir" -t "$HOME" "$package"
