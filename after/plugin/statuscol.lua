local builtin = require("statuscol.builtin")

local cfg = {
	setopt = true,
	thousands = false,
	relculright = false,
	ft_ignore = { "NvimTree", "alpha" },
	bt_ignore = nil,
	clickmod = "c",
	clickhandlers = {
		Lnum = builtin.lnum_click,
		FoldClose = builtin.foldclose_click,
		FoldOpen = builtin.foldopen_click,
		FoldOther = builtin.foldother_click,
		DapBreakpointRejected = builtin.toggle_breakpoint,
		DapBreakpoint = builtin.toggle_breakpoint,
		DapBreakpointCondition = builtin.toggle_breakpoint,
		["diagnostic/signs"] = builtin.diagnostic_click,
		gitsigns = builtin.gitsigns_click,
	},
}

full_segments = {
	{ text = { "%C" }, click = "v:lua.ScFa" },
	{
		text = { " %{v:lnum}" },
		hl = "CSign",
		condition = {
			function()
				return vim.opt.number
			end,
		},
	},
	{ text = { "%=%s" }, click = "v:lua.ScSa", hl = "CSign" },
	{
		text = { "%=%{v:relnum} " },
		condition = {
			function()
				return vim.opt.number and (vim.v.lnum % 2 == 1)
			end,
		},
		hl = "CursorLineNr",
	},
	{
		text = { "%=%{v:relnum} " },
		condition = {
			function()
				return vim.opt.number and (vim.v.lnum % 2 == 0)
			end,
		},
		hl = "CFold",
	},
}

rel_segments = {
	{ text = { "%C" }, click = "v:lua.ScFa" },
	{
		text = { " %=%{v:relnum} " },
		condition = {
			function()
				return vim.opt.number and (vim.v.lnum % 2 == 1)
			end,
		},
		hl = "CursorLineNr",
	},
	{
		text = { " %=%{v:relnum} " },
		condition = {
			function()
				return vim.opt.number and (vim.v.lnum % 2 == 0)
			end,
		},
		hl = "CFold",
	},
	{ text = { "%=%s" }, click = "v:lua.ScSa", hl = "CSign" },
}

if COL_STYLE == "full" then
  cfg.segments = full_segments
else
  cfg.segments = rel_segments
end

require("statuscol").setup(cfg)
