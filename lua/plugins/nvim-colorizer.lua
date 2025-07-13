local function config()
  local colorizer = require("colorizer")

  colorizer.setup()
end

return {
  "norcalli/nvim-colorizer.lua",
  config = config,
}
