local function keymaps()
  local bufferline = require("bufferline")

  local function cycle(direction)
    return function() bufferline.cycle(direction) end
  end
  local function move(direction)
    return function() bufferline.move(direction) end
  end
  vim.keymap.set("n", "<A-,>", cycle(-1), { desc = "Prev buffer" })
  vim.keymap.set("n", "<A-.>", cycle(1), { desc = "Next buffer" })
  vim.keymap.set("n", "<A-<>", move(-1), { desc = "Move buf left" })
  vim.keymap.set("n", "<A->>", move(1), { desc = "Move buf right" })
end

local style = {
  options = {
    mode = "buffers",
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = "",
      style = "none",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count) return "" .. count end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icons = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    move_wraps_at_ends = false,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    sort_by = "insert_at_end",
  },
}

local function config()
  local bufferline = require("bufferline")

  style.options.style_preset = bufferline.style_preset.minimal

  bufferline.setup(style)
  keymaps()
end

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config,
}
