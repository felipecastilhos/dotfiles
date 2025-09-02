# ============================================================================
# DEVELOPMENT EXPORTS - Development environment variables and PATH setup
# ============================================================================

# Development tool paths
export GODOT4="/usr/local/bin/godot"
export ANDROID_STUDIO="$HOME/Library/android-studio/bin"
export MINICONDA="$HOME/miniconda3/bin"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Add paths to PATH if they exist and not already present
add_to_path() {
    if [[ -d "$1" && ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}

# Add development tools to PATH
add_to_path "$ANDROID_STUDIO"
add_to_path "$MINICONDA"
add_to_path "$GODOT4"


