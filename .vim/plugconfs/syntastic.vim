set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <F6> :SyntasticCheck<CR>

"Recommanded settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_tex_checkers = ['lachex', 'text/language_check']

" Disable auto syntax check
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetype': []}
" Highlight syntax error
highlight SyntasticError guibg=#2f0000
" Multiple syntax check
"let g:syntastic_aggregate_errors = 1
