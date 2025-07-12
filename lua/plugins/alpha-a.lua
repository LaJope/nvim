local file = io.popen("chafa -f symbols ~/HDD/Backgrounds/.private/EtEKwDMW4AMEOSq.jpg -c full --size 30x80")
file:close()
file = nil
local formatted_lines = {}
local hl_segments = {}

if file ~= nil then
  local image = file:read("*a")
  file:close()
  local parsed_art = require("custom.parse_ansi").parse(image)

  for _, line in ipairs(parsed_art) do
    local formatted_line = ""
    local col_start = 0

    for _, segment in ipairs(line) do
      formatted_line = formatted_line .. segment.text
      if segment.fg then
        table.insert(hl_segments,
          {
            segment.fg.name,
            #formatted_lines + 1,
            col_start,
            col_start + #segment.text
          }
        )
      end
      if segment.bg then
        table.insert(hl_segments,
          {
            segment.bg.name,
            #formatted_lines + 1,
            col_start,
            col_start + #segment.text
          }
        )
      end
      col_start = col_start + #segment.text
    end
    table.insert(formatted_lines, formatted_line)
  end
end

local function newFile()
  local filename = vim.fn.input("Filename: ")
  if filename == "" then
    return
  end
  vim.cmd("e " .. filename)
end

local cd_command = "<cmd>cd " .. CONFIG_PATH .. "<CR>"

local display = {}
--dashboard.section.header.val = formatted_lines
--dashboard.section.header.opts.hl = hl_segments -- Apply highlights

local header = {
  opts = {
    position = "center",
    hl = hl_segments,
  },
  type = "text",
  val = formatted_lines,
}

local function config()
  local theme = require("alpha.themes.theta")

  local dashboard = require("alpha.themes.dashboard")
  theme.buttons.val = {
    {
      type = "text",
      val = "Quick links",
      opts = { hl = "SpecialComment", position = "center" },
    },
    { type = "padding", val = 1 },
    ---@diagnostic disable-next-line: param-type-mismatch
    dashboard.button("e", "  New file", newFile),
    dashboard.button("<spc>pf", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
    dashboard.button("<spc>pe", "󰈞  Find file (frecency)", "<cmd>Telescope frecency workspace=CWD<CR>"),
    dashboard.button("<spc>pg", "󰊄  Live grep", "<cmd>Telescope live_grep"),
    dashboard.button("c", "  Configuration", cd_command),
    dashboard.button("l", "  Open lazy", "<cmd>Lazy<CR>"),
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

  if #header.val == 0 then
    header = theme.header
  end

  theme.config.layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    section_mru,
    { type = "padding", val = 2 },
    theme.buttons,
  }

  require("alpha").setup(theme.config)
end

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config,
}
