if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/ccls' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

let g:lsp_settings = {
\  'clangd': {'cmd': ['clangd']},
\  'efm-langserver': {'disabled': v:false}
\}

map <LEADER>i :LspHover<CR>
map gd :LspDeclaration<CR>
autocmd FileType python map gd :LspDefinition<CR>
