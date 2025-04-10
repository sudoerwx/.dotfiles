local command = vim.api.nvim_create_user_command

command(
    'OR',
    function(opts)
        vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
    end,
    {}
)
