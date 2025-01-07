for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
  local name = vim.api.nvim_buf_get_name(bufnr)
  if string.find(name, "NvimTree") ~= nil then
    print("HELLO")
  end
end
