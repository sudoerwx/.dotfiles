return {
    {
        'stevearc/oil.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "benomahony/oil-git.nvim",
            "JezerM/oil-lsp-diagnostics.nvim",
        },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })



            local function getTelescopeOpts(path)
                return {
                    cwd = path,
                    search_dirs = { path },
                    attach_mappings = function(prompt_bufnr, map)
                        local actions = require "telescope.actions"
                        local oil = require("oil")
                        local cwd = oil.get_current_dir()

                        local function join(a, b)
                            if vim.fs and vim.fs.joinpath then
                                return vim.fs.joinpath(a, b)
                            end
                            if a:sub(-1) == "/" or a:sub(-1) == "\\" then
                                return a .. b
                            end
                            return a .. "/" .. b
                        end

                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                            local action_state = require "telescope.actions.state"
                            local selection = action_state.get_selected_entry()

                            -- Try the common fields used by pickers
                            local candidate = selection.path or selection.filename or selection.value or selection[1]
                            if not candidate or candidate == "" then return end

                            -- If it's not a real path yet, resolve relative to the picker cwd
                            if not vim.loop.fs_stat(candidate) then
                                candidate = join(cwd, candidate)
                            end

                            local stat = vim.loop.fs_stat(candidate)
                            oil.close()
                            vim.cmd.edit(vim.fn.fnameescape(candidate))
                        end)
                        return true
                    end
                }
            end

            require("oil").setup({
                delete_to_trash = true,
                keymaps = {
                    ["gd"] = {
                        desc = "Toggle file detail view",
                        callback = function()
                            detail = not detail
                            if detail then
                                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                            else
                                require("oil").set_columns({ "icon" })
                            end
                        end,
                    },

                    ["<leader>ff"] = {
                        desc = "Toggle file detail view",
                        callback = function()
                            local oil = require("oil")
                            local cwd = oil.get_current_dir()
                            local entry = oil.get_cursor_entry()
                            if cwd and entry then
                                require('telescope.builtin').find_files(getTelescopeOpts(string.format("%s/%s", cwd,
                                    entry.name)))
                            end
                        end,
                    },

                    ["<leader>fg"] = {
                        desc = "Toggle file detail view",
                        callback = function()
                            local oil = require("oil")
                            local cwd = oil.get_current_dir()
                            local entry = oil.get_cursor_entry()
                            if cwd and entry then
                                require('telescope.builtin').live_grep(getTelescopeOpts(string.format("%s/%s", cwd,
                                    entry.name)))
                            end
                        end,
                    },

                },
            })
        end
    }
}
