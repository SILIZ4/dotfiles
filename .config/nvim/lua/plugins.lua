local lazy_plugins = {
    'preservim/nerdcommenter',
    {
        'tpope/vim-fugitive',
        lazy=true,
        keys={
            { "<leader>gs", function() vim.cmd.Git() end, mode = "n" },
        }
    },
    {
        'kylechui/nvim-surround',
        init=function()
            require("nvim-surround").setup()
        end
    },
    'mhinz/vim-signify',
    'famiu/feline.nvim',
    {
        'catppuccin/nvim',
        name="catpuccin",
        init=function()
            require("catppuccin").setup({
                show_end_of_buffer = true,
                integrations = {
                    cmp = true,
                    harpoon = true,
                },
            })
            vim.cmd.colorscheme "catppuccin"
            vim.cmd("highlight LineNr guifg=gray63")
        end
    },
    {
        'ThePrimeagen/harpoon',
        dependencies='nvim-lua/plenary.nvim',
        lazy=true,
        keys={
            { "<leader>a", function() require"harpoon.mark".add_file() end, mode = "n" },
            { "<leader>j", function() require"harpoon.ui".nav_next() end, mode = "n" },
            { "<leader>k", function() require"harpoon.ui".nav_prev() end, mode = "n" },
            { "<leader>m", function() require"harpoon.ui".toggle_quick_menu() end, mode = "n" }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy=true,
        keys={
            { "<leader>sf", function() require"telescope.builtin".find_files() end, mode = "n" },
            { "<leader>sg", function() require"telescope.builtin".git_files() end, mode = "n" },
            { "<leader>sp", function() require"telescope.builtin".live_grep() end, mode = "n" },
        }
    },
    {
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
    },
    {
        'sbdchd/neoformat',
        keys={
            { "<leader>f", ":Neoformat<CR>", mode = "n", noremap=true },
        }
    },
    {
        'quarto-dev/quarto-nvim',
        ft='quarto',
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
        end
    },
    {
        'lervag/vimtex',
        ft='latex',
        init=function()
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
            'hrsh7th/cmp-nvim-lua',
        }
    },
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        dependencies= {
            'saadparwaiz1/cmp_luasnip'
        }
    }
}

vim.keymap.set("n", "<leader>vp", ":Lazy home<CR>")

require('lazy').setup(lazy_plugins, {})
