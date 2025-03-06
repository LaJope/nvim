local lint = require("lint")

lint.linters_by_ft = {
  cmake = { "cmakelint" },
  cpp = { "cpplint", "sonarlint-language-server" },
  gd = { "gdtoolkit" },
  go = { "golangci-lint" },
  Dockerfile = { "hadolint" },
  lua = { "luacheck" },
  python = { "pylint", "vulture" },
  bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
