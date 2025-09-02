# ============================================================================
# Load Tools - Tool configuration loader
# ============================================================================

# Load tool configurations. Ex.: nvm, conda, zoxide...
for tool_config in "$ZSH_CONFIG_DIR"/tools/*.zsh; do
  # Skip the loader itself to prevent recursion
  [[ "$(basename "$tool_config")" == "load_tools.zsh" ]] && continue
  [[ -r "$tool_config" ]] && source "$tool_config"
done
