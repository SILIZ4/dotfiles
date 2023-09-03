return {
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
}
