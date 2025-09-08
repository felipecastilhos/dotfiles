# Neovim Configuration

A modern, Lua-based Neovim configuration with LSP support and modular plugin organization.

## Structure

```
nvim/.config/nvim/
├── init.lua              # Main configuration entry point
├── lua/
│   ├── keymaps.lua       # Custom key mappings
│   ├── lsp.lua           # LSP server configurations
│   └── plugins/
│       ├── init.lua      # Plugin setup with lazy.nvim
│       ├── mason-config.lua  # Mason LSP/tool installer config
│       └── cmp-config.lua    # Autocompletion configuration
```

## Features

### Plugin Manager
- **Lazy.nvim** - Fast and feature-rich plugin manager with lazy loading

### Language Support
- **LSP Integration** - Language Server Protocol support via nvim-lspconfig
- **Mason** - Automatic LSP server and tool installation
- **Supported Languages**:
  - Bash/Shell (bashls)
  - Lua (lua_ls)
  - Auto-completion for all LSP-enabled languages

### Tools & Utilities
- **Stylua** - Lua code formatter
- **Shellcheck** - Shell script analysis tool

### Theme
- **Catppuccin Mocha** - Dark, soothing theme

### Key Mappings

#### System Clipboard
- `<Leader>y` - Copy to system clipboard
- `<Leader>yy` - Copy line to system clipboard
- `<Leader>p` - Paste from system clipboard

#### Smart Escape
- `<Esc>` - Context-aware escape:
  - Clear search highlights if active
  - Close quickfix/help windows
  - Exit netrw file explorer

## Editor Settings

### Visual
- Line numbers with relative numbering
- Mouse support enabled
- Custom cursor shapes for different modes
- Syntax highlighting

### Indentation
- 4-space tabs by default
- Language-specific indentation:
  - Python: 4 spaces
  - JSON: 2 spaces
- Smart tab behavior

### Search
- Incremental search
- Highlight search results
- Case-smart searching

### Special Features
- **Relative numbers toggle**: Disabled in insert mode for better readability
- **Spell checking**: Automatically enabled for Markdown files
- **Filetype-specific settings**: Optimized defaults for different file types

## Installation

This configuration is managed via GNU Stow as part of the dotfiles repository:

```bash
# From the dotfiles directory
stow nvim
```

## Dependencies

The configuration will automatically install required plugins and LSP servers through Mason, but ensure you have:

- Neovim >= 0.11
- Git (for plugin installation)
- Node.js (for some LSP servers)

## Customization

- **Add new LSP servers**: Edit `lua/plugins/mason-config.lua` 
- **Modify key mappings**: Edit `lua/keymaps.lua`
- **Add plugins**: Edit `lua/plugins/init.lua`
- **Adjust editor settings**: Edit `init.lua`
