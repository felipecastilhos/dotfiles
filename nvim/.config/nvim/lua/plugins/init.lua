local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
})

-- configure Catppuccin
require("catppuccin").setup({ flavour = "mocha" })
vim.cmd.colorscheme "catppuccin"

-- Configure Mason
require("mason").setup()

-- Configure mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = { "bashls" },
    automatic_installation = true,
})

require("plugins.cmp-config")
