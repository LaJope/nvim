local function config()
  vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>",
    { desc="Toggle Undotree" })
  vim.keymap.set("n", "<leader>ui", ":UndotreeFocus<CR>",
    { desc="Focus Undotree" })
end

return {
  "mbbill/undotree",
  config = config,
}
