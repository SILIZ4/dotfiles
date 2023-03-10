require('set')
require('remap')
require('plugs')
require('yank-hl')


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
