local function keymaps()
  local ufo = require("ufo")

  vim.keymap.set("n", "zR", ufo.openAllFolds)
  vim.keymap.set("n", "zM", ufo.closeAllFolds)
end

local function config()
  local lspconfig = require("lspconfig")
  local ufo = require("ufo")

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local language_servers = vim.lsp.get_clients()
  for _, ls in ipairs(language_servers) do
    lspconfig[ls].setup({
      capabilities = capabilities,
    })
  end

  ufo.setup()
  keymaps()
end

local dependencies = {
  "kevinhwang91/promise-async",
  "neovim/nvim-lspconfig",
}

return {
  "kevinhwang91/nvim-ufo",
  dependencies = dependencies,
  config = config,
}
