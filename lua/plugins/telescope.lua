local function telescope_config()
  local telescope = require("telescope.builtin")
  vim.keymap.set("n", "<leader>pf", telescope.find_files,
    { desc="Telescope find files" })
  vim.keymap.set("n", "<leader>pg", telescope.live_grep,
    { desc="Telescope live grep" })
  vim.keymap.set("n", "<leader>pb", telescope.buffers,
    { desc="Telescope buffers" })
  vim.keymap.set("n", "<leader>ph", telescope.help_tags,
    { desc="Telescope help tags" })
end

local function telescope_ui_config()
  local telescope = require("telescope")

  telescope.setup({
    extensions = {
      ["ui-select"] = { require("telescope.themes").get_dropdown {} }
    }
  })
  telescope.load_extension("ui-select")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", },
    config = telescope_config,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", },
    config = telescope_ui_config,
  }
}
