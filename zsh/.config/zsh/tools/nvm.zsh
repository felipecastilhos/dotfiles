export NVM_DIR="/usr/share/nvm"  

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
    nvm "$@"
}

node() {
    _load_nvm
    node "$@"
}

npm() {
    _load_nvm
    npm "$@"
}

npx() {
    _load_nvm
    npx "$@"
}
