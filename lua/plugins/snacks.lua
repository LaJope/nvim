local sections = {
	{
		section = "terminal",
		-- cmd = "chafa -f symbols ~/HDD/Backgrounds/public/daniil-silantev-iGCDwT8BKEk-unsplash.jpg -c full --size 60x17 --fit-width",
		cmd = "cat ~/.config/nvim/dashboard_image.txt",
		height = 17,
		padding = 1,
	},
	{ section = "keys", indent = 1, padding = 1 },
	{ pane = 2,  section = "recent_files", indent = 2, padding = 1 },
	{ section = "startup" },
}

local function newFile()
	local filename = vim.fn.input("Filename: ")
	if filename == "" then return end
	vim.cmd("e " .. filename)
end

local cd_config = "<cmd>cd " .. CONFIG_PATH .. "<CR>"

---@class snacks.dashboard.Config
---@field enabled? boolean
---@field sections snacks.dashboard.Section
---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
local dashboard = {
	width = 60,
	row = nil,
	col = nil,
	pane_gap = 4, -- empty columns between vertical panes
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	preset = {
		---@type fun(cmd:string, opts:table)|nil
		pick = nil,
		---@type snacks.dashboard.Item[]
		keys = {
			{ icon = " ", key = "e", desc = "New File", action = newFile },
			{ icon = " ", key = "pf", desc = "Find File", action = "<cmd>Telescope find_files<CR>" },
			{ icon = " ", key = "pg", desc = "Find Text", action = "<cmd>Telescope live_grep<CR>" },
			{ icon = " ", key = "pe", desc = "Recent Files", action = "<cmd>Telescope frecency workspace=CWD<CR>" },
			{ icon = " ", key = "c", desc = "Config", action = cd_config },
			{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
			{ icon = "🝚 ", key = "m", desc = "Mason", action = ":Mason", enabled = package.loaded.lazy ~= nil },
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		},
		-- Used by the `header` section
		header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	},
	sections = sections,
}

---@class snacks.statuscolumn.Config
---@field left snacks.statuscolumn.Components
---@field right snacks.statuscolumn.Components
---@field enabled? boolean
local statuscolumn = {
	enabled = true,
	left = { "mark", "sign" }, -- priority of signs on the left (high to low)
	right = { "fold", "git" }, -- priority of signs on the right (high to low)
	folds = {
		open = true, -- show open fold icons
		git_hl = true, -- use Git Signs hl for fold icons
	},
	git = {
		patterns = { "GitSign", "MiniDiffSign" },
	},
	refresh = 50,
}

local keys = {
	-- bufdelete
	{ "<A-c>", function() Snacks.bufdelete() end, desc = "Delete current buffer" },
	-- notifier
	{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
	-- scratch
	{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
	{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		bufdelete = { enabled = true },
		dashboard = dashboard, --chafa
		indent = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		scratch = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = statuscolumn,
    terminal = { enabled = true },
		words = { enabled = false },
	},
	keys = keys,
}
