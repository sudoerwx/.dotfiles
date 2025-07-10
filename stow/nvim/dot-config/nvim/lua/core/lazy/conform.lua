---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
    local conform = require("conform")
    for i = 1, select("#", ...) do
        local formatter = select(i, ...)
        if conform.get_formatter_info(formatter, bufnr).available then
            return formatter
        end
    end
    return select(1, ...)
end

local function tsformat(bufnr)
    return {
        first(bufnr, "prettierd", "prettier"),
        first(bufnr, 'eslint_d', 'eslint'),
        lsp_format =
        "first" --[[ 'eslint', "prettier",stop_after_first = true, ]]
    }
end


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
                    javascript = tsformat,
                    javascriptreact = tsformat,
                    typescript = tsformat,
                    typescriptreact = tsformat,
                },
            })




            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_format = "fallback", range = range })
            end, { range = true })

        end
    }
}
