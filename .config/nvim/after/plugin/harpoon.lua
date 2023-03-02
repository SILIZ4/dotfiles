local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>n", ui.nav_next)
vim.keymap.set("n", "<leader>N", ui.nav_prev)
vim.keymap.set("n", "<leader>f", ui.toggle_quick_menu)
