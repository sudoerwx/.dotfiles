return {
    {
        'emmanueltouzery/agitator.nvim',
        config = function()
            local ag = require('agitator')

            vim.keymap.set('n', "<leader>gt", function() ag.git_time_machine() end, { silent = true })
            vim.keymap.set('n', "<leader>gb", function() ag.git_blame() end, { silent = true })
        end
    }, }
