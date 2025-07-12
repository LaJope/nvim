local function config()
	local neotree = require("neo-tree")

	local function toggle()
		require("neo-tree.command").execute({
			action = "focus",
			source = "filesystem",
			position = "float",
			toggle = true,
		})
	end
	vim.keymap.set("n", "<C-n>", toggle, { desc = "Toggle Neotree" })
	vim.keymap.set("n", "<leader>e", toggle, { desc = "Toggle Neotree" })
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		-- fill any relevant options here
	},
	config = config,
}
