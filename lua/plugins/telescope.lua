local function keymaps()
	local telescope = require("telescope.builtin")

	vim.keymap.set("n", "<leader>pf", telescope.find_files, { desc = "Telescope find files" })
	vim.keymap.set("n", "<leader>pg", telescope.live_grep, { desc = "Telescope live grep" })
	vim.keymap.set("n", "<leader>pb", telescope.buffers, { desc = "Telescope buffers" })
	vim.keymap.set("n", "<leader>ph", telescope.help_tags, { desc = "Telescope help tags" })

	local frecency = "<Cmd>Telescope frecency workspace=CWD<CR>"
	vim.keymap.set("n", "<leader>pe", frecency, { desc = "Telescope frecency find files" })
end

local setup = {
	extensions = {
		frecency = {
			auto_validate = false,
			matcher = "fuzzy",
			path_display = { "filename_first" },
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
}

local function telescope_config()
	local ignore = require("custom.telescope-ignore")
	ignore.parseIgnoreFile()

	setup.defaults = { file_ignore_patterns = ignore.list }

	local telescope = require("telescope")

	telescope.setup(setup)

	telescope.load_extension("frecency")
	telescope.load_extension("ui-select")

	keymaps()
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = telescope_config,
}
