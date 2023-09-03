return {
    'tpope/vim-fugitive',
    lazy=true,
    keys={
        { "<leader>gs", function() vim.cmd.Git() end, mode = "n" },
    }
}
