require('set')
require('remap')
require('yank-hl')

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
require('plugins')

vim.cmd.colorscheme "catppuccin-latte"

-- Display line numbers in netrw
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

-- Remember cursor position when reopening file
vim.cmd([[
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

--  Remove trailing white spaces on save
vim.cmd([[
autocmd BufWritePre * %s/\s\+$//e
]])
