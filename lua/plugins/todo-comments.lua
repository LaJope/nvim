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

local function keymaps()
	local todo = require("todo-comments")

	vim.keymap.set("n", "]t", todo.jump_next, { desc = "Next todo comment" })
	vim.keymap.set("n", "[t", todo.jump_prev, { desc = "Previous todo comment" })

  local function cmd(action)
    return "<cmd>" .. action .. "<CR>"
  end

  vim.keymap.set("n", "<leader>pt", cmd("TodoTelescope"), {desc = "Telescope TODO"})
  vim.keymap.set("n", "<leader>tt", cmd("TodoTrouble"), {desc = "Trouble TODO"})
end

local function config()
	local todo = require("todo-comments")
	todo.setup(setup)

  keymaps()
end

local dependencies = {
	"nvim-lua/plenary.nvim",
}

return {
	"folke/todo-comments.nvim",
	dependencies = dependencies,
	config = config,
}
