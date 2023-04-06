let g:nvimgdb_disable_start_keymaps=1

tnoremap <ESC> <C-\><C-N>

nnoremap <leader>b :GdbBreakpointToggle<CR>
nnoremap <leader>n :GdbNext<CR>zz
nnoremap <leader>ds :GdbStep<CR>zz
nnoremap <leader>dc :GdbContinue<CR>zz
