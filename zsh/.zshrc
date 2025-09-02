# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_THEME="ys"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"

# Load tool configurations
for tool_config in "$ZSH_CONFIG_DIR"/tools/*.zsh; do
  [[ -r "$tool_config" ]] && source "$tool_config"
done

# Define  development enviroment
export GODOT4="/usr/local/bin/godot"
export ANDROID_STUDIO="$HOME/Library/android-studio/bin"
export MINICONDA="$HOME/miniconda3/bin"


# Set up Java stuff
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Fix Flameshot compatibility with Wayland
export QT_QPA_PLATFORM="wayland"

# Add paths to PATH if they exist and not already present
add_to_path() {
    if [[ -d "$1" && ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}

add_to_path "$ANDROID_STUDIO"
add_to_path "$MINICONDA"
[[ -x "$GODOT4" && ":$PATH:" != *":$GODOT4:"* ]] && PATH="$PATH:$GODOT4"

# Export the updated PATH
export PATH

#################### HISTORY #################### 
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS 
#################################################

setopt extendedglob nomatch
bindkey -e
eval "$(zoxide init zsh)"


# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotfixx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
