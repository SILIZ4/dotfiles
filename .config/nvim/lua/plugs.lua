local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kylechui/nvim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-vinegar'

Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
vim.cmd("Plug 'catppuccin/nvim', { 'as': 'catppuccin' }")

vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'sakhnik/nvim-gdb'
Plug 'sbdchd/neoformat'

-- Language-specific plugins
Plug 'lervag/vimtex'
Plug 'eigenfoo/stan-vim'
vim.cmd("Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }")

Plug 'ThePrimeagen/vim-be-good'

-- LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lua'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

vim.cmd("Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}")

vim.call('plug#end')
