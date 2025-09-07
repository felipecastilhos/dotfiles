-- LSP server configurations
local lspconfig = require("lspconfig")

-- Configure completion capabilities
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure LSP servers after mason-lspconfig
lspconfig.bashls.setup({
    filetypes = { "sh", "bash", "zsh" },
    capabilities = cmp_capabilities,
})

