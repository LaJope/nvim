local function set_gdscript_filetype()
  vim.defer_fn(function()
    vim.bo.filetype = 'gdscript'
  end, 1)
end

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = "*.gd",
  callback = set_gdscript_filetype
})

vim.keymap.set('n', '<C-s>', '<cmd>w!<CR>',
  { desc = 'Force save at gdscript file' })


local port = 6005
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local pipe = '/tmp/godot.pipe' -- I use /tmp/godot.pipe

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    -- vim.lsp.buf_attach_client(bufnr, client.id)
    -- print("Buffer " .. bufnr .. " attached to client " .. client.id)
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  end
})
