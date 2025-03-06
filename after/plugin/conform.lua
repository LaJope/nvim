require("conform").setup({
  formatters_by_ft = {
    asm = { "asmfmt" },
    nasm = { "asmfmt" },

    bash = { "beautysh" },
    zsh = { "beautysh" },
    sh = { "beautysh" },

    cmake = { "gersemi" },

    cpp = { "clang-format" },
    hpp = { "clang-format" },
    c = { "clang-format" },
    h = { "clang-format" },

    java = { "clang-format" },
    json = { "clang-format" },

    lua = { "stylua" },

    go = { "goimports" },

    python = { "pyink" },
    rust = { "rustfmt", lsp_format = "fallback" },
  },
})
