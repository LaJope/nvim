local function mason_config()
  local mason = require("mason")
  mason.setup()
end

local masonlp_setup = {
  ensure_installed = {
    -- "clangd",
    "lua_ls",
  }
}

local function mason_lsp_config()
  local masonlp = require("mason-lspconfig")
  masonlp.setup(masonlp_setup)
end

return {
  {
    "mason-org/mason.nvim",
    config = mason_config,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = mason_lsp_config,
  }
}
