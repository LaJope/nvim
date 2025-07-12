-- TODO: HELLO
-- NOTE: HELLO
-- FIX: HELLO
-- PERF: HELLO
-- WARNING: HELLO
-- HACK: HELLO

local setup = {
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
}

local function config()
	local todo = require("todo-comments")
	todo.setup(setup)

	vim.keymap.set("n", "]t", todo.jump_next, { desc = "Next todo comment" })
	vim.keymap.set("n", "[t", todo.jump_prev, { desc = "Previous todo comment" })
end

local dependencies = {
	"nvim-lua/plenary.nvim",
}

return {
	"folke/todo-comments.nvim",
	dependencies = dependencies,
	config = config,
}
