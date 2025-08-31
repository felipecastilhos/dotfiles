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
        echo "⚠️  Warning: '$path' does not exist, skipping..."
        return 1
    fi
    
    # Calculate relative path from HOME
    local relative_path="${path#$HOME/}"

    # Remove trailing slash for consistency
    relative_path="${relative_path%/}"
    
    # Create target path maintaining directory structure
    local target_path="$dotfiles_dir/$package/$relative_path"
    
    echo "📦 Moving $path to package: $package"
    
    if [[ -d "$path" ]]; then
        /usr/bin/mkdir -p "$(/usr/bin/dirname "$target_path")"
        /usr/bin/cp -r "$path" "$(/usr/bin/dirname "$target_path")/"
        /usr/bin/rm -rf "$path"
    else
        echo "This path --- $path"
        /usr/bin/mkdir -p "$(/usr/bin/dirname "$target_path")"
        /usr/bin/mv "$path" "$target_path"
    fi
}

# Process all paths
for path in "$@"; do
    backup_path "$path"
done

/usr/bin/mkdir --help
# Stow the package once at the end
echo "🔗 Stowing package: $package"
/usr/bin/stow -d "$dotfiles_dir" -t "$HOME" "$package"