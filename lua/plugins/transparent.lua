local function colorscheme()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme gruvbox-material")

	vim.api.nvim_set_hl(0, "LineNr", { fg = "LightPink" })

	vim.cmd("highlight CursorLine guibg=#282c34")
	vim.cmd("highlight CursorLineNr guifg=#d7e9f1")
	vim.cmd("highlight LineNr guifg=#98a8b8")
	vim.cmd("highlight Comment cterm=NONE guibg=NONE")
	vim.cmd("highlight FoldColumn guifg=#98a8b8")
	vim.cmd("highlight FloatBorder guibg=NONE")
	vim.cmd("highlight CFold guifg=#EBDBB2")
	vim.cmd("highlight CLineNr guifg=#eeeeff")
	-- vim.cmd("highlight CSign guifg=#EA6962")
	vim.cmd("highlight CSign guifg=#D4BE98")

	vim.cmd([[
    hi! LspReferenceRead cterm=bold ctermbg=235 guibg=#4b6769
    hi! LspReferenceText cterm=bold ctermbg=235 guibg=#4b6769
    hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=#4b6769
  ]])
end

local setup = {
	exclude_groups = { "CursorLine", "CursorLineNr", "Notify", "Neo-tree" },
}

local function config()
	local transparent = require("transparent")

	transparent.setup(setup)
	vim.cmd("TransparentEnable")

	colorscheme()

	transparent.clear_prefix("BufferLine")
	-- transparent.clear_prefix("Neo-tree")
	transparent.clear_prefix("TroubleNormal")
	transparent.clear_prefix("TreesitterContext")
end

return {
	{
		"xiyaowong/transparent.nvim",
		config = config,
	},
	{
		"sainnhe/gruvbox-material",
	},
}
