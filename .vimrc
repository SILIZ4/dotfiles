call plug#begin()

Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'preservim/nerdcommenter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-syntastic/syntastic'

Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'md' }

call plug#end()


set backspace=indent,eol,start
set wrap
set number
set relativenumber
set cursorline
set mouse=a
set smartindent
" Remove newline added at end of file
set nofixeol
" Shorten timeout of mappings
set timeoutlen=500
set clipboard=unnamedplus
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

syntax on
filetype plugin on
filetype indent on

" Color scheme
set background=light
colorscheme solarized
" set transparent background
"hi Normal guibg=NONE ctermbg=NONE
"hi CursorLine guibg=NONE ctermbg=NONE cterm=bold


nnoremap <SPACE> <Nop>
let mapleader=" "
command Q q
command W w

" Dont lose selection when indenting block
vnoremap > >gv
vnoremap < <gv

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


map <C-n> :NERDTreeToggle<CR>

source ~/.vim/additionnal_functions.vim
source ~/.vim/plugconfs/vim-lsp.vim
source ~/.vim/plugconfs/syntastic.vim
source ~/.vim/plugconfs/latex-live-preview.vim
source ~/.vim/plugconfs/asyncomplete.vim