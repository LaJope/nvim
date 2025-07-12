local function config()
  --local undotree = require("Undotree")

  vim.g.undotree_WindowLayout = 3

  vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>",
    { desc="Toggle Undotree" })
  vim.keymap.set("n", "<leader>ui", ":UndotreeFocus<CR>",
    { desc="Focus Undotree" })
end

return {
  "mbbill/undotree",
  config = config,
}
