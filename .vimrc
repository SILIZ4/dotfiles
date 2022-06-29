scriptencoding utf-8

call plug#begin()

" Utility
Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-rooter'
Plug 'haya14busa/incsearch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'michaeljsmith/vim-indent-object'
Plug 'godlygeek/tabular'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'SirVer/ultisnips'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" Language specific packages
Plug 'eigenfoo/stan-vim', { 'for': 'stan' }
Plug 'elixir-editors/vim-elixir'
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'tpope/vim-liquid'


call plug#end()


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
set timeoutlen=500
set wrap

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

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
" Allow saving of files as sudo when forgotten
cmap w!! w !sudo tee > /dev/null %

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Remove trailing white space on save
autocmd BufWritePre * %s/\s\+$//e
" Return cursor to previous location on load
autocmd BufReadPost * normal `"


noremap <LEADER>d :NERDTreeToggle<CR>
noremap <LEADER>f :Files<CR>

let g:NERDTreeIgnore = ['^build$', '.*\.pdf$', '.*\.bin$', '^__pycache__$', '.*\.egg-info$', ".*\.pdf$", ".*\.aux$", ".*\.bbl$", ".*\.blg$", ".*\.fdb_latexmk$", "*.\.fls$", ".*\.lof$", ".*\.lot$", ".*\.out$", ".*\.toc$", ".*\.xdv$", ".*\.fls$", ".*\.synctex.gz$"]
let g:rooter_targets = "*.cpp,*.h,*.hpp,CMakeLists.txt"
let g:rooter_patterns = ['.git', 'build', 'setup.py']

source ~/.vim/additionnal_functions.vim
source ~/.vim/plugconfs/asyncomplete.vim
source ~/.vim/plugconfs/gitgutter.vim
source ~/.vim/plugconfs/incsearch.vim
source ~/.vim/plugconfs/ultisnips.vim
source ~/.vim/plugconfs/vim-lsp.vim
source ~/.vim/plugconfs/vimtex.vim