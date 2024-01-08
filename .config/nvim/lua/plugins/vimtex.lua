return {
    'lervag/vimtex',
    lazy=false,
    ft='tex',
    init=function()
        vim.g.vimtex_motion_enabled = 0
        vim.g.vimtex_view_method = 'zathura'
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_enabled = 1

        vim.keymap.set('n', '<LEADER><CR>', ':VimtexCompile<CR>', {silent = true, noremap = true})
        vim.keymap.set('n', '<LEADER>t', ':VimtexView<CR>', {silent = true, noremap = true})
    end
}
