return {
    "benfowler/telescope-luasnip.nvim",
    lazy=false,
    module = "telescope._extensions.luasnip",
    config=function()
        require('telescope').setup()
        require('telescope').load_extension('luasnip')
        vim.keymap.set('n', '<leader>vs', ":Telescope luasnip<CR>", {silent = true, noremap = true})
    end
}
