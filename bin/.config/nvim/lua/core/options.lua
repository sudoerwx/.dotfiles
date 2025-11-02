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

-- screenshots
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



vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

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
vim.opt.confirm = true
vim.opt.showmatch = true    -- Highlight matching parenthesis
vim.opt.colorcolumn = '120' -- Line ht marker at *** columns
vim.opt.wrap = true

vim.g.netrw_fastbrowse = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
