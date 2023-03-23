local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"rust_analyzer",
	"texlab",
	"pyright",
	"clangd",
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- Don't preselect first item
lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer =  bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end)

-- Display virtual text with warnings and errors
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true, }
    )

lsp.setup()