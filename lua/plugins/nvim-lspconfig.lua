-- TODO: Confugure with blink.cmp

local function desc(opts, description) return vim.tbl_extend("force", opts, { desc = description }) end

local function callback(ev)
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  local opts = { buffer = ev.buf }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, desc(opts, "Go to declaration"))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, desc(opts, "Go to definition"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, desc(opts, "Go to implementation"))
  vim.keymap.set("n", "gr", vim.lsp.buf.references, desc(opts, "Show quickfix with references"))

  -- vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, desc(opts, "Signarure help"))
  vim.keymap.set("i", "<C-U>", vim.lsp.buf.signature_help, desc(opts, "Signarure help (insert mode)"))

  vim.keymap.set("n", "<leader>vd", vim.lsp.buf.type_definition, desc(opts, "Type definition"))
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, desc(opts, "Rename"))
  vim.keymap.set("n", "<leader>vi", vim.lsp.buf.code_action, desc(opts, "Code action"))
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, desc(opts, "Format using LSP"))

  vim.keymap.set("n", "K", vim.lsp.buf.hover, desc(opts, "Show hover information"))
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, desc(opts, "Show diagnostics information"))
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = callback,
})

local function config()
  --vim.lsp.enable("clangd")
  vim.lsp.enable("lua_ls")
end

local dependencies = {}

return {
  "neovim/nvim-lspconfig",
  dependencies = dependencies,
  config = config,
}
