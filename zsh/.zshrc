export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_THEME="ys"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#Load my modules
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/core/history.zsh"
source "$ZSH_CONFIG_DIR/core/system_fixes.zsh"
source "$ZSH_CONFIG_DIR/core/exports/development_exports.zsh"
source "$ZSH_CONFIG_DIR/tools/load_tools.zsh" # loads all tools config

# Export the updated PATH
export PATH

setopt extendedglob nomatch
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotfixx/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
