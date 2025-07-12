-- TODO Remove name from every segment. Instead store pixel by pixel. Create
-- hl_group for every pixel, not segment

local parser = {}

local function get_RGB(code, num)
  local R, G, B = code:match(num .. ";2;(%d+);(%d+);(%d+)")
  if R then
    return { R = tonumber(R), G = tonumber(G), B = tonumber(B) }
  end
  return nil
end

local function get_color(code, type)
  local col = nil
  if type == "Fg" then
    col = get_RGB(code, "38")
  elseif type == "Bg" then
    col = get_RGB(code, "48")
  end

  if col == nil then
    return nil
  end

  local name_pat = "Ansi" .. type .. "_%d_%d_%d"
  local hl_name = string.format(name_pat, col.R, col.G, col.B)

  local hex_pat = "#%02x%02x%02x"
  local hl_hex = string.format(hex_pat, col.R, col.G, col.B)

  return {
    color = col,
    name = hl_name,
    hex = hl_hex,
  }
end

local function parse_text(lines)
  local parsed_lines = {}

  for _, line in ipairs(lines) do
    local parsed_line = {}
    local current_fg = nil
    local current_bg = nil

    for code, text in line:gmatch("(\x1b%[[^m]+m)([^\x1b]*)") do
      current_fg = get_color(code, "Fg")
      current_bg = get_color(code, "Bg")

      if code:match("0m") then
        current_fg = nil
        current_bg = nil
      end

      if text ~= "" then
        table.insert(parsed_line, {
          text = text,
          fg = current_fg,
          bg = current_bg,
        })
      end
    end
    table.insert(parsed_lines, parsed_line)
  end

  return parsed_lines
end

local function set_hl(col, type)
  local hightlight = {}
  if type == "Fg" then
    hightlight = { fg = col.hex }
  elseif type == "Bg" then
    hightlight = { bg = col.hex }
  end

  vim.api.nvim_set_hl(0, col.name, hightlight)
end

parser.parse = function(ansi_art)
  local lines = vim.split(ansi_art, "\n")
  local parsed_lines = parse_text(lines)
  local hl_groups = {}

  for _, line in ipairs(parsed_lines) do
    for _, segment in ipairs(line) do
      if segment.fg and hl_groups[segment.fg.name] == nil then
        set_hl(segment.fg, "Fg")
        hl_groups[segment.fg.name] = true
      end
      if segment.bg and hl_groups[segment.bg.name] == nil then
        set_hl(segment.bg, "Bg")
        hl_groups[segment.bg.name] = true
      end
    end
  end

  return parsed_lines
end

return parser
