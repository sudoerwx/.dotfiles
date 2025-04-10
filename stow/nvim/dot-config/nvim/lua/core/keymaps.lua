local silent = { silent = true }

-- " mapping for buffers control
-- vim.keymap.set('n',"<S-H>", ":BufferPrevious<CR>", silent,{})
-- vim.keymap.set('n',"<S-L>", ":BufferNext<CR>", silent,{})

vim.keymap.set('n', "<S-H>", ":BufferLineCyclePrev<CR>", silent)
vim.keymap.set('n', "<S-L>", ":BufferLineCycleNext<CR>", silent)

vim.keymap.set('n', "<leader><leader>=", ":Neoformat<CR>", silent)
-- " save mappings
vim.keymap.set('n', "<C-S>", ":w<CR>", {})
vim.keymap.set('i', "<C-S>", "<C-O>:w<CR>", {})
vim.keymap.set('n', "<C-A>", ":noa w<CR>", {})
vim.keymap.set('i', "<C-A>", "<C-O>:noa w<CR>", {})
-- " Delete /Cut mapping
vim.keymap.set('n', "<leader>d", "d", {})
vim.keymap.set('x', "<leader>d", "d", {})
vim.keymap.set('n', "<leader>dd", "dd", {})
vim.keymap.set('n', "<leader>D", "D", {})
-- scroll map
vim.keymap.set('n', "<C-u>", "<C-u>zz", {})
vim.keymap.set('n', "<C-d>", "<C-d>zz", {})
-- " mapping paste
vim.keymap.set('i', "<C-p>", '<C-o>"+p', {})
vim.keymap.set('v', 'p', '"_dP', {})
-- " Buffers delete
vim.keymap.set('n', "<C-q>", ":Bdelete menu<CR>", {})
-- " Remapping for windows movements
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {})
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {})
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {})
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {})
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {})
vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>', {})
vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>', {})
vim.keymap.set('v', "<F2>", ":Ray<CR>", {})
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
