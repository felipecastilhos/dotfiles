-- Configure Mason
require("mason").setup()

-- Configure mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = { "bashls" },
    automatic_installation = true,
})

