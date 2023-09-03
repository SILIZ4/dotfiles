return {
    'ThePrimeagen/harpoon',
    dependencies='nvim-lua/plenary.nvim',
    lazy=true,
    keys={
        { "<leader>a", function() require"harpoon.mark".add_file() end, mode = "n" },
        { "<leader>j", function() require"harpoon.ui".nav_next() end, mode = "n" },
        { "<leader>k", function() require"harpoon.ui".nav_prev() end, mode = "n" },
        { "<leader>m", function() require"harpoon.ui".toggle_quick_menu() end, mode = "n" }
    }
}
