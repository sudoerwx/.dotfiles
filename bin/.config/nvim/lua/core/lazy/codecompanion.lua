return {
    {
        "olimorris/codecompanion.nvim",
        version = "^19.13.0",
        opts = {

            interactions = {
                chat = {
                    -- You can specify an adapter by name and model (both ACP and HTTP)
                    adapter = {
                        name = "copilot",
                        model = "gpt-4.1",
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
            }

        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    },

}
