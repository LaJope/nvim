local setup = {
	open_mapping = [[<c-q>]],
	hide_numbers = true,
	autochdir = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "float",
	close_on_exit = true,
	clear_env = false,
	shell = vim.o.shell,
	auto_scroll = true,
	float_opts = {
		border = "curved",
		title_pos = "center",
	},
	responsiveness = {
		horizontal_breakpoint = 0,
	},
}

local function config()
	local toggleterm = require("toggleterm")
	toggleterm.setup(setup)
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = config,
}
