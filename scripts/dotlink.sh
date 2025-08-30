#!/usr/bin/env zsh

# Help function
show_help() {
    cat << EOF
Usage: $0 [OPTIONS]

Link all dotfile packages using GNU Stow with conflict detection.

OPTIONS:
    -h, --help       Show this help message and exit

EXAMPLES:
    $0               # Link all packages automatically

DESCRIPTION:
    This script automatically stows all directories in ~/dotfiles (except scripts/):
    1. Iterates through all directories in ~/dotfiles
    2. Skips the 'scripts' directory and hidden directories
    3. Uses GNU Stow to create symlinks for each package
    4. Reports success or conflicts for each package
    5. Conflicts require manual resolution with 'stow --force'

EOF
}

# Check for help flag
case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
esac

cd ~/dotfiles

echo "🔗 Linking all packages..."


for package in */; do
    package=${package%/}

    if [[ "$package" == "scripts" ]]; then
        continue
    fi

    # Avoids non-directories and hidden files
    [[ -d "$package" && ! "$package" =~ ^\. ]] || continue

    echo "  Stowing $package"

    if stow "$package" 2>/dev/null; then
        echo "    ✅ Success"
    else
        echo "    ⚠️  Conflicts detected (run with --force to overwrite)"
    fi
done

echo "🎉 Linking complete!"
