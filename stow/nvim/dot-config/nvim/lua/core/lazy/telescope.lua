return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        }
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({ hidden = true }) end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fr', builtin.resume, {})
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fp', builtin.pickers, {})
        vim.keymap.set('n', '<leader>f<leader>', builtin.builtin, {})
        vim.keymap.set('n', '<C-p>', builtin.oldfiles, {})
    end
}
