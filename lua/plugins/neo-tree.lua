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

local function options(_, opts)
  -- stylua: ignore
  local function on_move(data)
    Snacks.rename.on_rename_file(data.source, data.destination)
  end

	local events = require("neo-tree.events")
	opts.event_handlers = opts.event_handlers or {}
	vim.list_extend(opts.event_handlers, {
		{ event = events.FILE_MOVED, handler = on_move },
		{ event = events.FILE_RENAMED, handler = on_move },
	})
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{ "echasnovski/mini.icons", version = "*" },
		"folke/snacks.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	opts = options,
	config = config,
}
