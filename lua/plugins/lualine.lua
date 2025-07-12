local options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '❘', right = '❘' },
  section_separators = { left = '', right = '' },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000
  },
}

local sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch', 'diff', 'diagnostics' },
  lualine_c = { 'filename' },
  lualine_x = { 'encoding', 'fileforman', 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' },
}

local inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { 'filename' },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

local function config()
  local lualine = require('lualine')
  lualine.setup({
    options = options,
    sections = sections,
    inactive_sections = inactive_sections,
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = config,
}
