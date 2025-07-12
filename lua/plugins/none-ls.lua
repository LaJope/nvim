local function config()
	local null_ls = require("null-ls")

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua.with({
				extra_args = { "--indent-width", "2", "--collapse-simple-statement", "Always" },
			}),
			null_ls.builtins.completion.spell,
			--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
		},
	})
end

return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
