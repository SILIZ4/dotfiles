if has_key(plugs, 'nvim-gdb')
    nnoremap <leader>dd :GdbStartPDB python -m pdb %<CR>
endif
