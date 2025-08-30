cd ~/dotfiles
if [[ -n $(git status --porcelain) ]]; then
    echo "🔶 Dotfiles have uncommitted changes"
    git status --short
else
    echo "✅ Dotfiles are up to date"
fi
cd - > /dev/null
