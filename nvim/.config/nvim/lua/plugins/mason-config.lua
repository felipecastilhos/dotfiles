-- Configure Mason
require("mason").setup()

-- Configure mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = { 
        "bashls",
        "lua_ls",
    },
    automatic_installation = true,
    automatic_enable = true,
})


require("mason-tool-installer").setup({
    ensure_installed = {
        "stylua",
        "shellcheck"
    }
})
