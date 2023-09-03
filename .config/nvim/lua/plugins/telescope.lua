return {
    'nvim-telescope/telescope.nvim',
    lazy=true,
    keys={
        { "<leader>sf", function() require"telescope.builtin".find_files() end, mode = "n" },
        { "<leader>sg", function() require"telescope.builtin".git_files() end, mode = "n" },
        { "<leader>ss", function() require"telescope.builtin".live_grep() end, mode = "n" },
    }
}
