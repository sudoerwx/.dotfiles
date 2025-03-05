return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
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
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({
            notification = {      -- NOTE: you're missing this outer table
                window = {
                    winblend = 0, -- NOTE: it's winblend, not blend
                },
            },
        })
        --
        --
        -- local lspconfig = require('lspconfig')
        -- local utils = require('utils.lsp')
        --
        -- -- add capabilities from nvim-cmp
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        --
        --
        function common_on_attach(client, bufnr)
            -- This function defines the on_attach function for several languages which share the same key-bidings
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>==', function()
                vim.lsp.buf.format { filter = function(client) return client.name ~= "ts_ls" end }
            end, bufopts)
        end

        -- vim.keymap.set('n', 'gn', ']d', bufopts)
        -- vim.keymap.set('n', 'gp', '[d', bufopts)

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
                "eslint_d",
                "prettier_d",
                -- 'lua-language-server',
                -- 'json-to-struct',
                -- 'misspell',
                -- 'shellcheck',
                -- 'vint',
                -- "html-lsp",
                -- "css-lsp",
                -- "cssmodules-language-server",
                -- "eslint-lsp",
                -- "emmet-ls",
                -- "json-lsp",
                -- "vim-language-server",
                -- "rust-analyzer",
                -- "tailwindcss-language-server"
                "angularls",
                "tailwindcss"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        on_attach = common_on_attach,
                        capabilities = capabilities
                    }
                end,

                -- zls = function()
                --   local lspconfig = require("lspconfig")
                --   lspconfig.zls.setup({
                --     root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                --     settings = {
                --       zls = {
                --         enable_inlay_hints = true,
                --         enable_snippets = true,
                --         warn_style = true,
                --       },
                --     },
                --   })
                --   vim.g.zig_fmt_parse_errors = 0
                --   vim.g.zig_fmt_autosave = 0
                -- end,
                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup {
                        on_attach = common_on_attach,
                        capabilities = capabilities,
                        settings = {
                            tsserver_file_preferences = {
                                includeInlayParameterNameHints = 'all',
                            },
                            -- tsserver_format_enable = false
                        }
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        on_attach = common_on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap = true, silent = true }

        -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

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
                ['<CR>'] = cmp.mapping.confirm({ select = fales }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' }
            }, {
                { name = 'buffer' },
            })
        })


        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.eslint_d,

            },
        })
        vim.diagnostic.config({
            virtual_text = {
                severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
                source = "always", -- Or "if_many"
            },
            signs = true,
            underline = true,
            -- update_in_insert = true,
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


-- {
--       function(serverName)
--         local config = {
--           on_attach = utils.common_on_attach,
--           capabilities = capabilities,
--         }
--
--         if serverName == "sumneko_lua" then
--           config.settings = {
--             Lua = {
--               runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--               },
--               diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--               },
--               workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--               },
--               -- Do not send telemetry data containing a randomized but unique identifier
--               telemetry = {
--                 enable = false,
--               },
--             },
--           }
--         end
--
--
--         if serverName == "eslint" then
--           config.on_attach = function(client, bufnr)
--             -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
--             -- the server capabilities of the eslint server ourselves!
--             client.server_capabilities.document_formatting = true
--             utils.common_on_attach(client, bufnr)
--           end
--           config.settings = {
--             format = { enable = true }, -- this will enable formatting
--           }
--         end
--
--
--         if serverName == "emmet_ls" then
--           config.filetypes = { "html", "css", "scss" }
--         end
--
--         if serverName == "angularls" then
--           config.filetypes = { "javascriptreact", "typescriptreact", "typescript.tsx", "htmlangular", "js", "javascript",
--             "ts", "typescript", "html" }
--         end
--
--         if serverName == "ts_ls" then
--           config.settings = {
--             preferences = {
--               includeInlayParameterNameHints = 'all',
--             },
--
--             ['typescript.format.enable'] = false
--           }
--         end
--
--
--
--         if serverName == "rust_analyzer" then
--           config.settings = {
--             ["rust-analyzer"] = {
--               assist = {
--                 importGranularity = "module",
--                 importPrefix = "self",
--               },
--               cargo = {
--                 loadOutDirsFromCheck = true
--               },
--               procMacro = {
--                 enable = true
--               },
--             }
--           }
--         end
--         lspconfig[serverName].setup(config)
--       end
--     }
