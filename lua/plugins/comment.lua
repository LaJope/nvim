local function keymaps()
	local api = require("Comment.api")

	vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, { desc = "Comment current line" })

	local linewise_visual = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
	vim.keymap.set("v", "<leader>/", linewise_visual, { desc = "Comment selected lines" })
end

local function config()
	local comment = require("Comment")

	comment.setup()
	keymaps()
end

return {
	"numToStr/Comment.nvim",
	config = config,
}
