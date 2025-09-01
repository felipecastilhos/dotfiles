# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_THEME="ys"

ENABLE_CORRECTION="true"

# We ihich plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_CONFIG_DIR/aliases.lua

# Define  development enviroment
export GODOT4="/usr/local/bin/godot"
export ANDROID_STUDIO="$HOME/Library/android-studio/bin"
export MINICONDA="$HOME/miniconda3/bin"

# Set up Node stuff
export NVM_DIR="$HOME/.nvm"
if [[ -z "$NVM_LOADED" ]]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    export NVM_LOADED=1
fi

# Set up Java stuff
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Fix Flameshot compatibility with Wayland
export QT_QPA_PLATFORM="wayland"
# Fix conda init
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

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
HISTSIZE=1000
SAVEHIST=1000
#################################################

setopt extendedglob nomatch
bindkey -e
eval "$(zoxide init zsh)"
# Load conda only once
if [[ -z "$CONDA_LOADED" && -f /opt/miniconda3/etc/profile.d/conda.sh ]]; then
    source /opt/miniconda3/etc/profile.d/conda.sh
    export CONDA_LOADED=1
fi

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick file backup
bak() {
  cp "$1"{,.bak}
}
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotfixx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
