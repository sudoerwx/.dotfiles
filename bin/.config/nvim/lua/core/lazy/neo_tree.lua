-- return {}

return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            -- Unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])


            -- NOTE: this is changed from v1.x, which used the old style of highlight groups
            -- in the form "LspDiagnosticsSignWarning"

            local function getTelescopeOpts(state, path)
                return {
                    cwd = path,
                    search_dirs = { path },
                    attach_mappings = function(prompt_bufnr, map)
                        local actions = require "telescope.actions"
                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                            local action_state = require "telescope.actions.state"
                            local selection = action_state.get_selected_entry()
                            local filename = selection.filename
                            if (filename == nil) then
                                filename = selection[1]
                            end
                            -- any way to open the file without triggering auto-close event of neo-tree?
                            require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
                        end)
                        return true
                    end
                }
            end

            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        hide_gitignored = false,
                        hide_dotfiles = true,
                    },
                    window = {
                        mappings = {
                            ["<leader>ff"] = "telescope_find",
                            ["<leader>fg"] = "telescope_grep",
                            ["l"] = "open",
                            ["h"] = "close_node",
                            ['<leader>a'] = 'avante_add_files',
                            ["o"] = "system_open",
                        },
                    },
                    commands = {
                        telescope_find = function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            require('telescope.builtin').find_files(getTelescopeOpts(state, path))
                        end,
                        telescope_grep = function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
                        end,
                        system_open = function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()

                            if vim.loop.os_uname().sysname == "Darwin" then
                                vim.api.nvim_command("silent !open -g " .. path)
                            else
                                vim.api.nvim_command("silent !xdg-open " .. path)
                            end
                        end,
                        avante_add_files = function(state)
                            local node = state.tree:get_node()
                            local filepath = node:get_id()
                            local relative_path = require('avante.utils').relative_path(filepath)

                            local sidebar = require('avante').get()

                            local open = sidebar:is_open()
                            -- ensure avante sidebar is open
                            if not open then
                                require('avante.api').ask()
                                sidebar = require('avante').get()
                            end

                            sidebar.file_selector:add_selected_file(relative_path)

                            -- remove neo tree buffer
                            if not open then
                                sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
                            end
                        end,

                    },
                    components = {
                        harpoon_index = function(config, node, _)
                            local harpoon_list = require("harpoon"):list()
                            local path = node:get_id()
                            local harpoon_key = vim.uv.cwd()

                            for i, item in ipairs(harpoon_list.items) do
                                local value = item.value
                                if string.sub(item.value, 1, 1) ~= "/" then
                                    value = harpoon_key .. "/" .. item.value
                                end

                                if value == path then
                                    vim.print(path)
                                    return {
                                        text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
                                        highlight = config.highlight or "NeoTreeDirectoryIcon",
                                    }
                                end
                            end
                            return {}
                        end,
                    },
                    renderers = {
                        file = {
                            { "icon" },
                            { "name",       use_git_status_colors = true },
                            -- { "harpoon_index" }, --> This is what actually adds the component in where you want it
                            { "diagnostics" },
                            { "git_status", highlight = "NeoTreeDimText" },
                        },
                    },
                },
            })

            vim.keymap.set('n', '<C-n>', ':Neotree toggle=true reveal=true<CR>', { silent = true })
        end,
    },
}
