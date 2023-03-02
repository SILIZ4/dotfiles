vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

vim.keymap.set("n", "Q", "<nop>")

-- Move lines text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Do not lose selection after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Paste onto without dropping register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Enable multi-line edit to apply with C-c
vim.keymap.set("i", "<C-c>", "<Esc>")
