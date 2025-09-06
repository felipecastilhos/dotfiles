-- Enable mouse
vim.opt.mouse = "a"

-- Syntax highlighting
vim.cmd("syntax on")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentations
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.guicursor = {
    "n-v-c:block",     -- Normal, Visual, Command → block
    "i-ci-ve:ver25",   -- Insert → vertical bar (25% width)
    "r-cr:hor20",      -- Replace → horizontal bar (20% height)
    "o:hor50",         -- Operator pending → horizontal bar
}

-- Filetype-specific settings
vim.api.nvim_create_augroup("FiletypeSpecific", { clear = true })

-- Python: 4-space tabs
vim.api.nvim_create_autocmd("FileType", {
    group = "FiletypeSpecific",
    pattern = "python",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})

-- Markdown: spell check
vim.api.nvim_create_autocmd("FileType", {
    group = "FiletypeSpecific",
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})

-- JSON: 2-space tabs
vim.api.nvim_create_autocmd("FileType", {
    group = "FiletypeSpecific",
    pattern = "json",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

-- Insert mode: toggle relative numbers
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
    end,
})

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

-- LSP server configurations
local lspconfig = require("lspconfig")

-- Configure LSP servers after mason-lspconfig
lspconfig.bashls.setup({
    filetypes = { "sh", "bash", "zsh" },
})

-- remaps
require("keymaps")
