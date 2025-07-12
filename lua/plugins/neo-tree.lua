local function config()
  vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle float<CR>",
    { desc="Toggle Neotree" })
  vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle float<CR>",
    { desc="Toggle Neotree" })
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = config,
}
