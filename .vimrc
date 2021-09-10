call plug#begin()

Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'elliotpatros/vim-endwise'
Plug 'airblade/vim-rooter'
Plug 'haya14busa/incsearch.vim'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'eigenfoo/stan-vim', { 'for': 'stan' }
Plug 'tpope/vim-liquid'
Plug 'elixir-editors/vim-elixir'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'md' }

call plug#end()


set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
set incsearch
set mouse=a
set nofixeol
set number
set relativenumber
set signcolumn=yes
set smartindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set timeoutlen=500
set wrap
set noshowmode
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab


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

let g:NERDTreeIgnore = ['^build$', '*.bin$']
let g:rooter_patterns = ['.git', 'build']


source ~/.vim/additionnal_functions.vim
source ~/.vim/plugconfs/asyncomplete.vim
source ~/.vim/plugconfs/gitgutter.vim
source ~/.vim/plugconfs/incsearch.vim
source ~/.vim/plugconfs/latex-live-preview.vim
source ~/.vim/plugconfs/vim-lsp.vim