return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
    },

    config = function()

        require("fidget").setup({
            notification = {      -- NOTE: you're missing this outer table
                window = {
                    winblend = 0, -- NOTE: it's winblend, not blend
                },
            },
        })

        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "html",
                "cssls",
                "cssmodules_ls",
                "eslint",
                "emmet_ls",
                "jsonls",
                "vimls",
                "ts_ls",
                "jdtls",
                "angularls",
                "tailwindcss",
                -- 'shellcheck',
                -- 'misspell',
                -- "emmet-ls",
                -- "eslint_d",
                -- "prettierd",
            },
        })


        vim.lsp.config('ts_ls', {
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = 'all',
                },
                editor = { suggest = { showSnippets = false } }
                -- tsserver_format_enable = false
            }
        })

        vim.lsp.config('lua_ls', {

            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                    }
                }
            }

        })

        vim.diagnostic.config({
            virtual_text = {
                -- severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
                source = "always", -- Or "if_many"
            },
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                -- border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
