local silent = { silent = true }
local silentNoremap = { noremap = true, silent = true, }

-- LSP mappings
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, silentNoremap)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, silentNoremap)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, silentNoremap)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, silentNoremap)
vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, silentNoremap)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, silentNoremap)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, silentNoremap)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, silentNoremap)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, silentNoremap)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, silentNoremap)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, silentNoremap)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, silentNoremap)


-- mapping for buffers control
-- vim.keymap.set('n',"<S-H>", ":BufferPrevious<CR>", silent,{})
-- vim.keymap.set('n',"<S-L>", ":BufferNext<CR>", silent,{})
vim.keymap.set('n', "<S-H>", ":BufferLineCyclePrev<CR>", silent)
vim.keymap.set('n', "<S-L>", ":BufferLineCycleNext<CR>", silent)

-- formatting mappings
-- vim.keymap.set('n', "<leader><leader>=", ":Neoformat<CR>", silent)
vim.keymap.set('n', '<leader>==', function()
    -- vim.lsp.buf.format { filter = function(client) return client.name ~= "ts_ls" end }
    require("conform").format()
end, { noremap = true, silent = true, })

-- save mappings
vim.keymap.set('n', "<C-S>", ":w<CR>", {})
vim.keymap.set('i', "<C-S>", "<C-O>:w<CR>", {})
vim.keymap.set('n', "<C-A>", ":noa w<CR>", {})
vim.keymap.set('i', "<C-A>", "<C-O>:noa w<CR>", {})

-- Delete /Cut mapping
vim.keymap.set('n', "<leader>d", "d", {})
vim.keymap.set('x', "<leader>d", "d", {})
vim.keymap.set('n', "<leader>dd", "dd", {})
vim.keymap.set('n', "<leader>D", "D", {})

-- scroll map
vim.keymap.set('n', "<C-u>", "<C-u>zz", {})
vim.keymap.set('n', "<C-d>", "<C-d>zz", {})

-- mapping paste
vim.keymap.set('i', "<C-p>", '<C-o>"+p', {})
vim.keymap.set('v', 'p', '"_dP', {})

-- Buffers delete
vim.keymap.set('n', "<C-q>", ":Bdelete menu<CR>", {})

-- Remapping for windows movements
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {})
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {})
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {})
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {})
vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>', {})
vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>', {})

-- Code screenchot snippet Ray mapping
vim.keymap.set('v', "<F2>", ":Ray<CR>", {})

-- Neogen doc generation
vim.keymap.set('n', "gdd", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })

-- Make current file executable
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>', {})

-- vim.keymap.set('n', '-', ':!xdg-open %<CR>', {})
-- vim.keymap.set('n',"<F8>", ":SymbolsOutline<CR>",{})

-- Line swapping
-- vim.keymap.set('n','<c-j>', ' :m .+1<CR>==',{})
-- vim.keymap.set('n','<c-k>', ':m .-2<CR>==',{})
-- inoremap('<c-j>', '<Esc>:m .+1<CR>==gi')
-- inoremap('<c-k>', '<Esc>:m .-2<CR>==gi')
-- vim.keymap.set('v','<c-j>', ":m '>+1<CR>gv=gv",{})
-- vim.keymap.set('v','<c-k>', ":m '<-2<CR>gv=gv",{})

-- in lua
-- vim.keymap.set({'n','i'},"<ScrollWheelUp>", "<C-Y>",{})
-- vim.keymap.set({'n','i'},"<ScrollWheelDown>", "<C-E>",{})
vim.keymap.set("n", "<C-f>", "<cmd>silent! !tmux neww tmux-sessionizer<CR>", {})
