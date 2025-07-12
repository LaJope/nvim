local function pairs_config()
  local pairs = require("mini.pairs")
  pairs.setup()
end

return {
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = pairs_config,
  },
}
