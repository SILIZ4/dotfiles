if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/ccls' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_settings_filetype_python = 'pyright-langserver'
let g:lsp_settings = {
\  'clangd': {'cmd': ['clangd']},
\  'efm-langserver': {'disabled': v:false},
\}

nnoremap <LEADER>i :LspHover<CR>
nnoremap <LEADER>r :LspRename<CR>
nnoremap <LEADER>e :LspNextError<CR>
nnoremap <LEADER>w :LspNextWarning<CR>
nnoremap gd :LspDeclaration<CR>
autocmd FileType python nnoremap gd :LspDefinition<CR>
