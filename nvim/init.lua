vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)

-- LSP SUPPORT --

local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup({
    on_attach = function(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

nvim_lsp.rust_analyzer.setup({
    on_attach = function(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

nvim_lsp.pyright.setup({
    on_attach = function(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

-- MY STUFF --

vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "*.rs",
    callback = function ()
        vim.lsp.buf.format();
    end,
})

vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "*.nix",
    callback = function ()
        vim.cmd("%!alejandra -qq");
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.nix",
    callback = function ()
        vim.opt_local.tabstop = 2;
        vim.opt_local.shiftwidth = 2;
    end
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ALT backspace for deleting words in insert mode
vim.api.nvim_set_keymap('i', '<M-BS>', '<C-o>db', { noremap = true })

-- Ctrl . to open lsp diagnostic
vim.api.nvim_set_keymap('n', '<C-.>', ":lua vim.lsp.buf.code_action()<CR>", { noremap = true })
