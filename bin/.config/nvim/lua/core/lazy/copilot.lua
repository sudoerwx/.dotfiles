return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },                   -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },

    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            "copilotlsp-nvim/copilot-lsp" 
        },
        init = function()
            vim.g.copilot_nes_debounce = 500
        end,
        cmd = "Copilot",
        opts = {
            -- copilot_model = "gpt-4o-copilot",
            panel = {
                enabled = true,
                auto_refresh = true,
                keymap = {
                    open = "<M-p>"
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = false,
                keymap = {
                    accept = "<M-s>",
                    next = "<M-w>",
                    prev = "<M-m>",
                    dismiss = "<M-x>",
                },
            },
            nes = {
                enabled = true,
                keymap = {
                    accept_and_goto = "<M-e>",
                    accept = false,
                    dismiss = "<Esc>",
                },
            }
        }
    },
}
