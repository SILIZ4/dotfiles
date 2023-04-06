if has_key(plugs, 'nvim-gdb')
    nnoremap <leader>dd :GdbStart rust-gdb -q
endif
