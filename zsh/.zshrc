# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_THEME="ys"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/core/history.zsh"
source "$ZSH_CONFIG_DIR/core/exports/development_exports.zsh"

# Load tool configurations
for tool_config in "$ZSH_CONFIG_DIR"/tools/*.zsh; do
  [[ -r "$tool_config" ]] && source "$tool_config"
done

# Fix Flameshot compatibility with Wayland
export QT_QPA_PLATFORM="wayland"

# Export the updated PATH
export PATH

setopt extendedglob nomatch
bindkey -e
eval "$(zoxide init zsh)"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotfixx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
