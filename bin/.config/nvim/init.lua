require('core.options')
require('core.lazy_init')
require('core.themes')
require('core.keymaps')
require('core.usercommands')
require('core.autocomands')
-- require('core.localnvimvariables')
-- check if file exist by lua means then require it, if not - ignore
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

if file_exists(vim.fn.stdpath('config') .. '/core/localnvimvariables.lua') then
  require('core.localnvimvariables')
end
