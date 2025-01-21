require("conform").setup({
  formatters_by_ft = {
    asm = { 'asmfmt' },
    nasm = { 'asmfmt' },

    bash = { 'beautysh' },
    zsh = { 'beautysh' },
    sh = { 'beautysh' },

    cpp = { 'clang-format' },
    json = { 'clang-format' },
    java = { 'clang-format' },
    c = { 'clang-format' },
    hpp = { 'clang-format' },
    h = { 'clang-format' },

    lua = { "lua-format" },

    go = { 'goimports' },

    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true }
  }
})
