vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.listchars = {
    eol = '↲',
    tab = '» ',
    trail = '·',
    extends = '<',
    precedes = '>',
    conceal = '┊',
    nbsp = '␣',
}
vim.opt.list = true
vim.opt.shortmess:append({ c = true })

vim.g.mapleader = ' '
-- " screenshots
vim.g.ray_options = {
    colors = 'candy'
}
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_better_performance = 1

vim.g.gitgutter_sign_added = '▎'
vim.g.gitgutter_sign_modified = '▎'
vim.g.gitgutter_sign_removed = '▎'

vim.g.diffget_local_map = 'gj'
vim.g.diffget_upstream_map = 'gf'
vim.g.neoformat_only_msg_on_error = 1


-- Nord
vim.g.nord_bold = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true


----
-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"




-- -----------------------------------------------------------
-- -- General
-- -----------------------------------------------------------
-- vim.opt.mouse = 'a'                               -- Enable mouse support
--
-- vim.opt.swapfile = false                          -- Don't use swapfile
-- vim.opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options
-- vim.opt.wildmenu = true
-- vim.opt.hlsearch = false
vim.opt.confirm = true
-- vim.opt.showmode = false
-- vim.opt.showcmd = false
-- vim.opt.undofile = true
-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.undolevels = 3000
-- vim.opt.undoreload = 10000
-- vim.opt.background = "dark"
-- vim.opt.cmdheight = 1
--
-- -----------------------------------------------------------
-- -- Neovim UI
-- -----------------------------------------------------------
-- vim.opt.number = true       -- Show line number
vim.opt.showmatch = true    -- Highlight matching parenthesis
vim.opt.colorcolumn = '120' -- Line ht marker at 80 columns
-- vim.opt.splitright = true   -- Vertical split to the right
-- vim.opt.splitbelow = true   -- Horizontal split to the bottom
-- vim.opt.ignorecase = true   -- Ignore case letters when search
-- vim.opt.smartcase = true    -- Ignore lowercase for the whole pattern
-- vim.opt.linebreak = true    -- Wrap on word boundary
--
-- if vim.fn.has('termguicolors') == 1 then
--   vim.opt.termguicolors = true -- Enable 24-bit RGB colors
-- end
--
-- vim.opt.laststatus = 0 -- Set global statusline
vim.opt.wrap = true
-- vim.opt.cursorline = true
-- vim.opt.bg = "dark"
-- vim.opt.ruler = false
--
-- -- Always show the signcolumn, otherwise it would shift the text each time
-- -- diagnostics appear/become resolved.
-- -- if vim.fn.has('patch-8.1.1564') == 1 then
-- --   -- Recently vim can merge signcolumn and number column into one
-- --   opt.signcolumn = 'number'
-- -- else
-- --   opt.signcolumn = 'yes'
-- -- end
--
--
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
-- vim.opt.hidden = true    -- Enable background buffers
-- vim.opt.history = 100    -- Remember N lines in history
-- vim.opt.synmaxcol = 240  -- Max column for syntax highlight
-- vim.opt.updatetime = 300 -- ms to wait for trigger an event
--
-----------------------------------------------------------
-- -- Tabs, indent
-- -----------------------------------------------------------
-- vim.opt.expandtab = true   -- Use spaces instead of tabs
-- vim.opt.shiftwidth = 0     -- Shift 4 spaces when tab
-- vim.opt.tabstop = 2        -- 1 tab == 4 spaces
-- vim.opt.softtabstop = 2    -- 1 tab == 4 spaces
-- vim.opt.smartindent = true -- Autoindent new lines
-- vim.opt.smartcase = true
-- vim.opt.ignorecase = true
-- vim.g.ctrlp_map = '<c-p>'
-- vim.g.ctrlp_cmd = 'CtrlPMRU'
-- "session config
-- g.session_autoload = 'no'
-- g.session_autosave = 'yes'
-- " g.session_autosave_to = 'default'
-- g.session_verbose_messages = 0
-- "DoGE settings
-- g.doge_mapping = '<leader><leader>d'
-- vim.g.emmetJsx = 1
-- g.nord_cursor_line_number_background = 1
-- vim.api.nvim_set_var('$NVIM_TUI_ENABLE_TRUE_COLOR', 1)

-- vim.g.ctrlp_user_command = { '.git', 'cd %s && git ls-files -co --exclude-standard' }
-- vim.g.ctrlp_extensions = {
--   'branches'
-- }
vim.g.netrw_fastbrowse = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
