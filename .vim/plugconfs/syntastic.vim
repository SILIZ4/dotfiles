"Recommanded settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_tex_checkers = ['lachex', 'text/language_check']


noremap <LEADER>s :SyntasticCheck<CR>

" Disable auto syntax check
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetype': []}
" Highlight syntax error
highlight SyntasticError guibg=#2f0000
" Multiple syntax check
"let g:syntastic_aggregate_errors = 1
