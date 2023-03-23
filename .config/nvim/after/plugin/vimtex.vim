let g:vimtex_motion_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_enabled = 0

noremap <LEADER><CR> :VimtexCompile<CR>
noremap <LEADER>t :VimtexView<CR>
