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
