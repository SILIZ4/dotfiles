scriptencoding utf-8

set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
set display+=truncate
set hidden
set incsearch
set mouse=a
set nofixeol
set noshowmode
set number
set relativenumber
set signcolumn=yes
set smartindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set timeoutlen=1000
set ttimeoutlen=25
set wrap

set laststatus=2 " Always display the statusline in all windows

let &t_SI = "\e[6 q" " Slim cursor in insert mode
let &t_EI = "\e[2 q"

syntax on
filetype plugin on
filetype indent on

"transparent background
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE ctermbg=NONE cterm=bold
hi clear LineNr

nnoremap <SPACE> <Nop>
let mapleader=" "

command Q q
command W w

cmap w!! w !sudo tee > /dev/null % " Write file as sudo when forgotten

vnoremap > >gv " Dont lose selection when indenting block
vnoremap < <gv
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap - :Ex<CR>
nnoremap <LEADER>f :Files<CR>

autocmd BufWritePre * %s/\s\+$//e " Remove trailing white space on save
autocmd BufReadPost * normal `" " Return cursor to previous location on load
