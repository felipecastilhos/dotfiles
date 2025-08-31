# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# We ihich plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

###################### ALIASSES ################################### 
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Lines configured by zsh-newuser-install


####################################################################

#################### PATH SETUP #################### 
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
#################################################

#################### HISTORY #################### 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#################################################

setopt extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotfixx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias imgcat="wezterm imgcat"
alias ls="lsd --color=auto"
alias android-studio="~/Library/android-studio/bin/studio.sh"
alias spritesheetify="~/scripts/spritesheetify.sh"
alias bookr="~/scripts/tools/books/book_rename.sh"
alias jupyter="/opt/miniconda3/bin/jupyter"
alias jupyverse="/opt/miniconda3/bin/jupyverse"
alias mongodb="/usr/bin/mongod"
alias cd="z"
alias vim="nvim"
alias cat="bat -pp"

# dotfiles utilities
alias dotbkper="~/dotfiles/scripts/dotbkper.sh"
alias dotsync="~/dotfiles/scripts/dotsync.sh"
alias dotstatus="~/dotfiles/scripts/dotstatus.sh"
alias dotlink="~/dotfiles/scripts/dotlink.sh"

# Load conda only once
if [[ -z "$CONDA_LOADED" && -f /opt/miniconda3/etc/profile.d/conda.sh ]]; then
    source /opt/miniconda3/etc/profile.d/conda.sh
    export CONDA_LOADED=1
fi
eval "$(zoxide init zsh)"

mkcd() {
  mkdir -p "$1" && cd "$1"
}

