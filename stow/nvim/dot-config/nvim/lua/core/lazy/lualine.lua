return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local new_auto = require 'lualine.themes.gruvbox-material'

            if (new_auto.normal.c) then new_auto.normal.c.bg = 'transparent' end
            if (new_auto.inactive.c) then new_auto.inactive.c.bg = 'transparent' end
            if (new_auto.insert.c) then new_auto.insert.c.bg = 'transparent' end
            if (new_auto.visual.c) then new_auto.visual.c.bg = 'transparent' end
            if (new_auto.replace.c) then new_auto.replace.c.bg = 'transparent' end

            require('lualine').setup {
                options = {
                    globalstatus = true,
                    theme = new_auto,
                    component_separators = '',
                },
                sections = {
                    lualine_a = { { 'mode', right_padding = 2 } },
                    lualine_b = { 'branch', 'diff' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'filetype' },
                    lualine_y = { { 'diagnostics', colored = false,
                        symbols = { error = " ", warn = " ", hint = " ", info = " "

                        },

                    }, 'fileformat', 'encoding' },
                    lualine_z = {
                        { 'location', }
                    },

                },
                extensions = { 'quickfix', 'neo-tree', 'nvim-dap-ui' }
            }
        end,
    },
}
