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
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-l>'] = cmp_action.luasnip_jump_forward(),
        ['<C-h>'] = cmp_action.luasnip_jump_backward(),
    },
})

-- Avoid bug where completion occurs after deletion of snippet
local ls = require('luasnip')
ls.config.set_config({
	region_check_events = 'CursorMoved',
    delete_check_events = 'TextChanged',
    updateevents = "TextChanged,TextChangedI",
})

local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local function startswith(text, prefix)
    return text:find(prefix, 1, true) == 1
end

ls.add_snippets("tex", {
    s(
    "begin",
    fmt(
        [[
        \begin{<><>
        \end{<>}
        ]],
        {
            i(1, "env"),
            d(2, function(args)
                if args[1][1] == "frame" then
                    return sn(nil, {t("}{"), i(1, "Title"), t({"}", "\t"}), i(2, "")})

                elseif startswith(args[1][1], "figure") then
                    return sn(nil, fmt([[
                    }
                        \centering
                        \includegraphics{<>}
                        \caption{<>}
                    ]],
                    { i(1, "figname"), i(2, "caption") },
                    { delimiters = "<>" }
                    ))

                elseif args[1][1] == "document" then
                    return sn(nil, {t({"}", "", ""}), i(1, "\\maketitle"), t({"", ""})})
                end

                return sn(nil, {t({"}", "\t"}), i(1, "")})
            end, {1}),
            f(
                function (args, _, _) return args[1][1] end, {1}, {}
            ),
        },
        { delimiters = "<>" }
    )),

    s(
    "cm", fmt([[\newcommand{<>}{<>}]], {i(1, "\\"), i(2, "")}, { delimiters = "<>" })
    )
})
