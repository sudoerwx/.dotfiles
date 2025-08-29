-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand


-- Format on save
-- autocmd('BufWritePre', {
--   pattern = '*',
--   -- callback = function()
--   --   vim.lsp.buf.format({ async = false })
--   -- end
--   command = "Neoformat"
-- })
autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
                return
            end
        end
        vim.diagnostic.open_float({
            scope = "cursor",
            focusable = false,
            close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
            },
        })
    end
})
--
-- autocmd('BufReadPost,FileReadPost', {
--   pattern = '*',
--   command='normal zR'
-- })



-- augroup('import_cost_auto_run', { clear = true })
-- autocmd({ 'InsertLeave', 'BufWrite', 'BufEnter' }, {
--   group = 'import_cost_auto_run',
--   pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
--   command = 'ImportCost'
-- })
--
--
-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'HighlightedyankRegion', timeout = '700' })
    end
})


-- setted color for quick scope plugin
augroup('qs_colors', { clear = true })
autocmd('ColorScheme', {
    group = 'qs_colors',
    command = "highlight QuickScopePrimary guibg='#434C5E' gui=underline cterm=underline"
})
autocmd('ColorScheme', {
    group = 'qs_colors',
    command = "highlight QuickScopeSecondary  gui=underline cterm=underline"
})

autocmd({ 'CursorMoved', 'BufEnter' }, {
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'neo-tree' then
            vim.api.nvim_command('norm 0')
        end
    end
})

-- autocmd('FileType', {
--     pattern = 'netrw',
--     command = 'setl bufhidden=wipe',
-- })


-- autocmd('ColorScheme', {
--   pattern = '*',
--   command = "highlight NormalFloat guibg=#1f2335"
-- })
-- autocmd('ColorScheme', {
--   pattern = '*',
--   command = "highlight FloatBorder guifg=white guibg=#1f2335"
-- })


local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
