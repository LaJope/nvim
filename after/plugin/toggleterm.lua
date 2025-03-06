require("toggleterm").setup({
  -- open_mapping = [[<c-i>]],
  hide_numbers = true,
  autochdir = false,
  -- highlights = {
  --   Normal = {
  --     guibg = "<VALUE-HERE>",
  --   },
  --   NormalFloat = {
  --     link = 'Normal'
  --   },
  --   FloatBorder = {
  --     guifg = "<VALUE-HERE>",
  --     guibg = "<VALUE-HERE>",
  --   },
  -- },
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = 'float',
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = true,
  clear_env = false,
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = 'curved',
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- width = <value>,
    -- height = <value>,
    -- row = <value>,
    -- col = <value>,
    -- winblend = 0,
    -- zindex = <value>,
    title_pos = 'center'
  },
  responsiveness = {
    horizontal_breakpoint = 0,
  }
})
