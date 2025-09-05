# ============================================================================
# NVM - Node.js version management (lazy loading)
# ============================================================================
export NVM_DIR="$HOME/.nvm"  

_load_nvm() { 
    if [[ -z "$NVM_LOADED" ]]; then
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        export NVM_LOADED=1
    fi
}

# Wrapper functions that trigger lazy loading
nvm() {
    _load_nvm
    command nvm "$@"
}

node() {
    command node "$@"
}

npm() {
    command npm "$@"
}

npx() {
    command npx "$@"
}
