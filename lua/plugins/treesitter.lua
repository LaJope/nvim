local keymaps = {
  init_selection = "<leader><C-space>",
  node_incremental = "<C-space>",
  scope_incremental = false,
  node_decremental = "<bs>",
}

local config = function ()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup({
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = keymaps,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  event = { "BufReadPre", "BufNewFile" },
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = config,
}
