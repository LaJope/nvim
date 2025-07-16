local context_setup = {
	enable = true,
	multiwindow = false,
	max_lines = 0,
	min_window_height = 0,
	line_numbers = true,
	multiline_threshold = 20,
	trim_scope = "outer",
	mode = "cursor",
	separator = "-",
	zindex = 20,
	on_attach = nil,
}

local function context_config()
	local context = require("treesitter-context")

	context.setup(context_setup)
end

local keymaps = {
	init_selection = "<leader><C-space>",
	node_incremental = "<C-space>",
	scope_incremental = false,
	node_decremental = "<bs>",
}

local treesitter_setup = {
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = keymaps,
	},
}

local function treesitter_config()
	local treesitter = require("nvim-treesitter.configs")
	treesitter.setup(treesitter_setup)
end

local dependencies = {
	"nvim-treesitter/nvim-treesitter-textobjects",
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = context_config,
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = dependencies,
	event = { "BufReadPre", "BufNewFile" },
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = treesitter_config,
}
