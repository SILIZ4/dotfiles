local components = {
    active = { {}, {}},
    inactive = { {} }
}

local midgray = '#757575'

components.active[1] = {
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                fg = require('feline.providers.vi_mode').get_mode_color(),
                style = 'bold'
            }
        end,
        left_sep = '  ',
        right_sep = ' ',
        icon = ''
    },
    {
        provider = '> ',
        hl = {
            fg = '#bfbff2'
        }
    },
    {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            }
        },
        hl = {
            fg = midgray
        },
        icon = ''
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
            fg = '#FFC000'
        }
    },
}

components.active[2] = {
    {
        provider = 'git_branch',
        right_sep = '\t',
        hl = {
            fg = '#dd7878'
        }
    },
    {
        provider = 'position',
        right_sep = '\t\t',
    },
    {
        provider = 'line_percentage',
        right_sep = ' ',
    },
}

components.inactive[1] = {
    {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            }
        },
        hl = {
            fg=midgray
        },
        left_sep = ' ',
        icon = ''
    },
}

local light_theme = {
    bg = '#dce0e8',
    fg = '#3b3b3b'
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

return {
    'freddiehaddad/feline.nvim',
    dependencies={
        {
            'lewis6991/gitsigns.nvim',
            init=function() require('gitsigns').setup() end
        },
    },
    config=function()
        require'feline'.setup {
            components = components,
            theme=light_theme,
            vi_mode_colors = mode_colors
        }
    end
}
