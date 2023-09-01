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
	vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.signature_help() end, opts)
end)
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>vl", ":Mason<CR>")

-- Display virtual text with warnings and errors
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true, }
    )

lsp.setup()


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-l>'] = cmp_action.luasnip_jump_forward(),
        ['<C-h>'] = cmp_action.luasnip_jump_backward(),
    },
})

-- Avoid bug where completion occurs after deletion of snippet
local ls = require('luasnip')
ls.config.set_config({
	region_check_events = "CursorMoved",
    delete_check_events = 'TextChanged',
})
