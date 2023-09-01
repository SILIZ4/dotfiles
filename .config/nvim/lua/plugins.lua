local lazy_plugins = {
    'preservim/nerdcommenter',
    {
       'tpope/vim-fugitive',
        config=function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    {
        'kylechui/nvim-surround',
        config=function()
            require("nvim-surround").setup()
        end
    },
    'mhinz/vim-signify',
    'famiu/feline.nvim',
    {
        'catppuccin/nvim',
        config=function()
            require("catppuccin").setup({
                show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
                integrations = {
                    cmp = true,
                    harpoon = true,
                },
            })
            -- setup must be called before loading
            vim.cmd.colorscheme "catppuccin"
            vim.cmd("highlight LineNr guifg=gray63")
        end
    },
    {
        'ThePrimeagen/harpoon',
        dependencies='nvim-lua/plenary.nvim',
        config=function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>j", ui.nav_next)
            vim.keymap.set("n", "<leader>k", ui.nav_prev)
            vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        config=function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies={
            'nvim-treesitter/nvim-treesitter-context',
        },
        config=function()
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
    },
    {
        'sbdchd/neoformat',
        config=function()
            vim.keymap.set('n', '<leader>f', ":Neoformat<CR>", {noremap = true})
        end
    },
    {
        'quarto-dev/quarto-nvim',
        dependencies={
            'jmbuhr/otter.nvim',
            'hrsh7th/nvim-cmp',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter'
        },
        config=function()
            local quarto = require('quarto')
            quarto.setup()

            vim.keymap.set('n', '<leader><CR>', quarto.quartoPreview, {silent = true, noremap = true})
        end,
        ft='quarto'
    },
    {
        'lervag/vimtex',
        ft='latex',
        config=function()
            vim.g.vimtex_motion_enabled = 0
            vim.g.vimtex_view_method = 'zathura'
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_quickfix_enabled = 0

            vim.keymap.set('n', '<LEADER><CR>', ':VimtexCompile<CR>', {silent = true, noremap = true})
            vim.keymap.set('n', '<LEADER>t', ':VimtexView<CR>', {silent = true, noremap = true})
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        build='cd app & yarn install',
        ft='markdown'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies={
            {"williamboman/mason.nvim", priority=1},
            {"williamboman/mason-lspconfig.nvim", priority=2},
            {"neovim/nvim-lspconfig", priority=3},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
        }
    },
    -- autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies={
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua'
        }
    },
}

vim.keymap.set("n", "<leader>vp", ":Lazy home<CR>")

require('lazy').setup(lazy_plugins, {})
