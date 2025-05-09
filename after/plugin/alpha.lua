local theme = require("alpha.themes.theta")

local cd_command = "<cmd>cd " .. CONFIG_PATH .. "<CR>"

local function newFile()
  local filename = vim.fn.input('Filename: ')
  vim.cmd("e " .. filename)
end

local dashboard = require("alpha.themes.dashboard")
theme.buttons.val = {
  { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
  { type = "padding", val = 1 },
  dashboard.button("e", "  New file", newFile),
  dashboard.button("<spc>pe", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("<spc>pf", "󰈞  Find file (frecency)", "<cmd>Telescope frecency workspace=CWD<CR>"),
  dashboard.button("<spc>ps", "󰊄  Live grep", "<cmd>Telescope live_grep"),
  dashboard.button("c", "  Configuration", cd_command),
  dashboard.button("u", "  Open lazy", "<cmd>Lazy<CR>"),
  dashboard.button("m", "  Open mason", "<cmd>Mason<CR>"),
  dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
}

theme.file_icons.provider = "devicons"

local mru = theme.mru
local section_mru = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Recent files",
      opts = {
        hl = "SpecialComment",
        shrink_margin = false,
        position = "center",
      },
    },
    { type = "padding", val = 1 },
    {
      type = "group",
      val = function()
        return { mru(1, vim.fn.getcwd()) }
      end,
      opts = { shrink_margin = false },
    },
  },
}

theme.config.layout = {
  { type = "padding", val = 2 },
  theme.header,
  { type = "padding", val = 2 },
  section_mru,
  { type = "padding", val = 2 },
  theme.buttons,
}


require("alpha").setup(theme.config)
