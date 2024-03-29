require 'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all",
  ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }
}
