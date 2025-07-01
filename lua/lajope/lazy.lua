local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"mbbill/undotree",
	"tpope/vim-fugitive",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- Manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP support
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
			{ "rafamadriz/friendly-snippets" },
		},
	},
	"esensar/nvim-dev-container",

	{
		"Djancyp/better-comments.nvim",
		config = function()
			require("better-comment").Setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"lukas-reineke/indent-blankline.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	"mfussenegger/nvim-dap",
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opt = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},
	},

	"lewis6991/gitsigns.nvim",
	{
		"akinsho/bufferline.nvim",
		version = "*",
	},

	"nvim-lualine/lualine.nvim",

	"tpope/vim-obsession",
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
			require("which-key").setup()
		end,
	},
	"Civitasv/cmake-tools.nvim",

	"ojroques/nvim-bufdel",
	"xiyaowong/transparent.nvim",
	"rcarriga/nvim-notify",
	"onsails/lspkind.nvim",
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { { "kevinhwang91/promise-async" } },
	},
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = { { "MunifTanjim/nui.nvim" } },
	},

	"ncm2/float-preview.nvim",

	-- {
	-- 	"mistricky/codesnap.nvim",
	-- 	build = "make",
	-- },

	"sainnhe/gruvbox-material",

	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	"christoomey/vim-tmux-navigator",

	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "echasnovski/mini.icons", version = "*" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	"luukvbaal/statuscol.nvim",
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	"mfussenegger/nvim-lint",
	{
		"goolord/alpha-nvim",
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = { startVisible = false },
	},
	-- { "echasnovski/mini.surround", version = "*" },
}

local opts = {}

require("lazy").setup(plugins, opts)
