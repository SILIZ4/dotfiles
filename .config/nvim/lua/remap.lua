vim.keymap.set("n", "Q", "<nop>")
-- Open netrw
vim.keymap.set("n", "-", ":Ex<CR>")

-- Move block in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-h>", "<gv")
vim.keymap.set("v", "<C-l>", ">gv")

-- Center after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")

-- Do not lose selection after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Paste onto without dropping register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Enable multi-line edit to apply with C-c
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>st", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
