local function description(opts, desc)
  return vim.tbl_extend("force", opts, { desc = desc })
end

local function callback(ev)
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  local opts = { buffer = ev.buf }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
    description(opts, "Go to declaration"))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition,
    description(opts, "Go to definition"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
    description(opts, "Go to implementation"))
  vim.keymap.set("n", "gr", vim.lsp.buf.references,
    description(opts, "Show quickfix with references"))

  vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help,
    description(opts, "Signarure help"))
  vim.keymap.set("i", "<C-U>", vim.lsp.buf.signature_help,
    description(opts, "Signarure help (insert mode)"))

  vim.keymap.set("n", "<leader>vd", vim.lsp.buf.type_definition,
    description(opts, "Type definition"))
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename,
    description(opts, "Rename"))
  vim.keymap.set({ "n", "i" }, "<leader>vi", vim.lsp.buf.code_action,
    description(opts, "Code action"))
  vim.keymap.set("n", "<leader>f",
    function() vim.lsp.buf.format { async = true } end,
    description(opts, "Format using LSP"))

  vim.keymap.set("n", "K", vim.lsp.buf.hover,
    description(opts, "Show hover information"))
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
    description(opts, "Show diagnostics information"))
end

vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = callback,
  }
)

local function config()
  local lspconfig = require("lspconfig")

  --vim.lsp.enable("clangd")
  vim.lsp.enable("lua_ls")
end

return {
  "neovim/nvim-lspconfig",
  config = config,
}
