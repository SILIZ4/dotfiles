local components = {
    active = { {}, {}},
    inactive = { {}, {}}
}

components.active[1] = {
    {
        provider = ' '
    },
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                fg = require('feline.providers.vi_mode').get_mode_color(),
                bg = '#d6d6d6',
                style = 'bold'
            }
        end,
        right_sep = 'block',
        left_sep = 'block',
        icon = ''
    },
    {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            }
        },
        left_sep = ' ',
        icon = ''
    },
    {
        provider = 'search_count',
        left_sep = ' ',
    },
    {
        provider = 'diagnostic_errors',
        left_sep = ' |',
        hl = {
            fg = '#cc0000'
        }
    },
    {
        provider = 'diagnostic_warnings',
        left_sep = ' ',
        hl = {
            fg = '#ffc72e'
        }
    },
}

components.active[2] = {
    {
        provider = 'position',
        left_sep = ' ',
    },
    {
        provider = 'line_percentage',
        left_sep = '\t\t',
        right_sep = ' ',
    },
}

local light_theme = {
    bg = "#bababa",
    fg = "#3b3b3b"
}

local mode_colors = {
    NORMAL = '#009900',
    COMMAND = '#573D1C',
    INSERT = '#CB48B7',
    VISUAL = '#F75C03',
    LINES = '#F75C03',
    BLOCK = '#F75C03',
    REPLACE = '#710A2C',
    VREPLACE = '#710A2C',
}

require'feline'.setup {
    components = components,
    theme=light_theme,
    vi_mode_colors = mode_colors
}
