" Packages imported with pathogen
" - nerdcommenter
" - vim-flake8
" - vimtex
" - syntastic
" - vim-latex-live-preview
" - markdown-preview.nvim
" Packages installed with vim
" coc.nvim autocomplete
execute pathogen#infect()
call mkdp#util#install()

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

syntax on
filetype plugin on
filetype indent on

" Color scheme
set background=dark
colorscheme stellarized
" set transparent background
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE ctermbg=NONE cterm=bold

" Powerline status bar
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'solarized',
\ }

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Copy and paste to other programs
set clipboard=unnamedplus

" Dont lose selection when indenting block
vnoremap > >gv
vnoremap < <gv

" Set tab to 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Set :X :Q :W to their lowercase
command Q q
command W w

" Remove tailing white spaces with <F5>
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Display output of shell in split window
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize '
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
" Close scratch buffer
nnoremap Q :q<CR>

" Map Nerd FileTree to ctl-o
map <C-n> :NERDTreeToggle<CR>

" Recommanded settings Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -- Syntastic ---
" Disable auto syntax check
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetype': []}
" Highlight syntax error
highlight SyntasticError guibg=#2f0000
" Multiple syntax check
"let g:syntastic_aggregate_errors = 1
" Map syntax check to <F6>
nnoremap <F6> :SyntasticCheck<CR>
" LaTeX syntax checker
let g:syntastic_tex_checkers = ['lachex', 'text/language_check']

" LaTeX pdf viewer
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'
let g:livepreview_cursorhold_recompile = 0

" ---------- coc.nvim setup ----------
" Set tab to autocomplete
set hidden
set updatetime=300

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename current word <F2>
nmap <F2> <Plug>(coc-rename)
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)