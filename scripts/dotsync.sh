#!/usr/bin/env zsh

cd ~/dotfiles

# Check if there are changes
if [[ -n $(git status --porcelain) ]]; then
    echo "📦 Changes detected, committing..."
    git add .
    git commit -m "Update dotfiles - $(date '+%Y-%m-%d %H:%M')"
    git push
    echo "✅ Dotfiles synced!"
else
    echo "✨ No changes to sync"
fi

cd -
