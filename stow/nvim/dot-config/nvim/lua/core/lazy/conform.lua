return {
    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                default_format_opts = {
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", 'eslint_d', lsp_format = "first", --[[ 'eslint', "prettier",stop_after_first = true, ]] },
                },
            })
        end
    }
}
