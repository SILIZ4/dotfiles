let g:vimtex_motion_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = "latex"

noremap <LEADER>p :VimtexCompile<CR>
noremap <LEADER>s :VimtexView<CR>


if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIMD')
endif
