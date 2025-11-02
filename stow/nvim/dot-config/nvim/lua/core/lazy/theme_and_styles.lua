return {
    'HiPhish/rainbow-delimiters.nvim',
    'sainnhe/gruvbox-material',
    -- 'shaunsingh/nord.nvim',
    -- {
    --   'AlexvZyl/nordic.nvim',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require 'nordic'.load()
    --   end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
                on_colors = function(hl, c)
                    hl.LineNr = { fg = '#5eacd3', }
                end

            })
        end

    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true, -- disables setting the background color.
            })
        end
    },
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require('kanagawa').setup({
                compile = true,   -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true,    -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {
                    -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave", -- Load "wave" theme when 'background' option is not set
                background = {
                    -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus"
                },
            })
            -- vim.cmd([[colorscheme kanagawa]])
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({ '*' }, { css = true })
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                colors = {
                    error = { "#DB4B4B", "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "#E0AF68", "DiagnosticWarning", "WarningMsg", "#FBBF24" },
                    info = { "#0EB9D7", "DiagnosticInfo", "#2563EB" },
                    hint = { "#12B981", "DiagnosticHint", "#10B981" },
                    default = { "#A387D8", "Identifier", "#7C3AED" },
                },
                keywords = {
                    FIX = {
                        alt = { "fixme", "bug", "fixit", "issue" },
                    },
                    TODO = { alt = { "todo" } },
                    HACK = { alt = { "hack" } },
                    WARN = { alt = { "warn", "warning", "xxx" } },
                    PERF = { alt = { "perf", "optim", "performance", "optimize" } },
                    NOTE = { alt = { "note", "info" } },
                },
            }
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup { scope = { highlight = highlight } }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },
}
