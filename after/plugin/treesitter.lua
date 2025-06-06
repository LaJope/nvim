require('nvim-treesitter.configs').setup({
  ensure_installed = { 'c', 'python', 'lua', 'vim', 'vimdoc', 'query', 'gdscript' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  }
})
