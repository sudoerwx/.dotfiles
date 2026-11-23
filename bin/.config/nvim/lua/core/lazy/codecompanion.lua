return {
    {
        "olimorris/codecompanion.nvim",
        -- version = "^19.13.0",
        opts = {
            extensions = {
                spinner = {},
            },
            interactions = {
                chat = {
                    -- You can specify an adapter by name and model (both ACP and HTTP)
                    adapter = {
                        -- name = "copilot",
                        name = "codex",
                        -- name= "copilot_acp",
                        -- model = "gpt-4.1",
                        model = "gpt-6.1-sol",
                    },
                },
                inline = {
                    keymaps = {
                        accept_change = {
                            modes = { n = "ga" },
                            description = "Accept the suggested change",
                        },
                        reject_change = {
                            modes = { n = "gr" },
                            opts = { nowait = true },
                            description = "Reject the suggested change",
                        },
                        stop = {
                            modes = { n = "q" },
                            index = 4,
                            callback = "keymaps.stop",
                            description = "Stop request",
                        },

                    },

                },
            },
            adapters = {
                acp = {
                    codex = function()
                        return require("codecompanion.adapters").extend("codex", {
                            defaults = {
                                auth_method = "chat-gpt", -- Can be "api-key" or "chat-gpt"
                            },
                            -- env = {
                            --     OPENAI_API_KEY = "my-api-key",
                            -- },
                        })
                    end,
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "franco-ruggeri/codecompanion-spinner.nvim",
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    },

}
