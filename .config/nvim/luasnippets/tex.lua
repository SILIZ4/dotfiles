local fmt = require("luasnip.extras.fmt").fmt

local ls = require('luasnip')
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node

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
