#!/usr/bin/env zsh

# Help function
show_help() {
    cat << EOF
Usage: $0 [OPTIONS] [COMMIT_MESSAGE]

Sync dotfiles to Git repository with automatic commit and push.

ARGUMENTS:
    COMMIT_MESSAGE    Custom commit message (optional)
                     Default: "Update dotfiles - YYYY-MM-DD HH:MM"

OPTIONS:
    -h, --help       Show this help message and exit

EXAMPLES:
    $0                                    # Use default commit message
    $0 "Add nvim configuration"           # Custom commit message
    $0 "Fix zsh aliases and functions"    # Message with spaces

DESCRIPTION:
    This script checks for changes in ~/dotfiles directory and:
    1. Stages all changes (git add .)
    2. Commits with provided or default message
    3. Pushes to remote repository
    4. Shows success/no-changes message

EOF
}

# Check for help flag
case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
esac

MESSAGE="${1:-"Update dotfiles - $(date '+%Y-%m-%d %H:%M')"}"

cd ~/dotfiles

# Check if there are changes
if [[ -n $(git status --porcelain) ]]; then
    echo "📦 Changes detected, committing..."
    git add .
    git commit -m "$MESSAGE"
    git push
    echo "✅ Dotfiles synced!"
else
    echo "✨ No changes to sync"
fi

cd -
