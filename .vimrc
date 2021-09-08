call plug#begin()

Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

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
set signcolumn=yes

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

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


noremap <LEADER>d :NERDTreeToggle<CR>
noremap <LEADER>f :Files<CR>

source ~/.vim/additionnal_functions.vim
source ~/.vim/plugconfs/vim-lsp.vim
source ~/.vim/plugconfs/latex-live-preview.vim
source ~/.vim/plugconfs/gitgutter.vim
source ~/.vim/plugconfs/asyncomplete.vim