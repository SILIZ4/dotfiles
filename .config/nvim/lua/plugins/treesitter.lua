return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies={
        'nvim-treesitter/nvim-treesitter-context',
    },
    init=function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = { "c", "lua", "vim", "cpp", "rust", "python", "latex" },
          sync_install = false,
          auto_install = true,

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
    end
}
