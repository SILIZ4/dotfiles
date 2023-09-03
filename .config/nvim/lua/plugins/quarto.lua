return {
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
}
