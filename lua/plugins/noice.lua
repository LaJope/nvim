local setup = {
	cmdline = {
		enabled = true,
		view = "cmdline_popup", -- cmdline
		opts = {},
		---@type table<string, CmdlineFormat>
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			input = { view = "cmdline_input", icon = "󰥻 " },
		},
	},
	messages = {
		enabled = true,
		view = "notify",
		view_error = "notify",
		view_warn = "notify",
		view_history = "messages",
		view_search = "virtualtext",
	},
	popupmenu = {
		enabled = true,
		---@type 'nui'|'cmp'
		backend = "nui",
		---@type NoicePopupmenuItemKind|false
		kind_icons = {},
	},
	---@type NoiceRouteConfig
	redirect = {
		view = "popup",
		filter = { event = "msg_show" },
	},
	---@type table<string, NoiceCommand>
	commands = {
		history = {
			view = "split",
			opts = { enter = true, format = "details" },
			filter = {
				any = {
					{ event = "notify" },
					{ error = true },
					{ warning = true },
					{ event = "msg_show", kind = { "" } },
					{ event = "lsp", kind = "message" },
				},
			},
		},
		last = {
			view = "popup",
			opts = { enter = true, format = "details" },
			filter = {
				any = {
					{ event = "notify" },
					{ error = true },
					{ warning = true },
					{ event = "msg_show", kind = { "" } },
					{ event = "lsp", kind = "message" },
				},
			},
			filter_opts = { count = 1 },
		},
		errors = {
			view = "popup",
			opts = { enter = true, format = "details" },
			filter = { error = true },
			filter_opts = { reverse = true },
		},
		all = {
			view = "split",
			opts = { enter = true, format = "details" },
			filter = {},
		},
	},
	notify = {
		enabled = true,
		view = "notify",
	},
	lsp = {
		progress = {
			enabled = true,
			--- @type NoiceFormat|string
			format = "lsp_progress",
			--- @type NoiceFormat|string
			format_done = "lsp_progress_done",
			throttle = 1000 / 30,
			view = "mini",
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		hover = {
			enabled = true,
			silent = false,
			view = nil,
			---@type NoiceViewOptions
			opts = {},
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = true,
				trigger = true,
				luasnip = true,
				throttle = 50,
			},
			view = nil,
			---@type NoiceViewOptions
			opts = {},
		},
		message = {
			enabled = true,
			view = "notify",
			opts = {},
		},
		documentation = {
			view = "hover",
			---@type NoiceViewOptions
			opts = {
				lang = "markdown",
				replace = true,
				render = "plain",
				format = { "{message}" },
				win_options = { concealcursor = "n", conceallevel = 3 },
			},
		},
	},
	markdown = {
		hover = {
			["|(%S-)|"] = vim.cmd.help,
			["%[.-%]%((%S-)%)"] = require("noice.util").open,
		},
		highlights = {
			["|%S-|"] = "@text.reference",
			["@%S+"] = "@parameter",
			["^%s*(Parameters:)"] = "@text.title",
			["^%s*(Return:)"] = "@text.title",
			["^%s*(See also:)"] = "@text.title",
			["{%S-}"] = "@parameter",
		},
	},
	health = {
		checker = true,
	},
	---@type NoicePresets
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
	throttle = 1000 / 30,
	---@type NoiceConfigViews
	views = {}, ---@see section on views
	---@type NoiceRouteConfig[]
	routes = {}, --- @see section on routes
	---@type table<string, NoiceFilter>
	status = {}, --- @see section on statusline components
	---@type NoiceFormatOptions
	format = {}, --- @see section on formatting
}

local setup = {
	messages = {
		enabled = true,
	},
	cmdline = {
		format = {
			cmdline = { icon = ">" },
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
}

local function config()
	local noice = require("noice")
	noice.setup(setup)
end

local dependencies = {
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
}

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = dependencies,
	config = config,
}
