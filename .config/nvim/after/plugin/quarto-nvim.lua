local quarto = require('quarto')
quarto.setup()

vim.keymap.set('n', '<leader><CR>', quarto.quartoPreview, {silent = true, noremap = true})
