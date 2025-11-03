return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')

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





        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
                { name = 'luasnip' }, -- For luasnip users.
            })
        })


        vim.diagnostic.config({
            virtual_text = {
                severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
                source = "always", -- Or "if_many"
            },
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
