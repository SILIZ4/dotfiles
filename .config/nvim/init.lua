require('vim-options')
require('vim-keymaps')
require('vim-functions')
require('file-settings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>vp", ":Lazy home<CR>")
require('lazy').setup(
    "plugins",
    {
        default = { lazy=true }
    }
)


vim.cmd.colorscheme "catppuccin-latte"

-- Display line numbers in netrw
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
