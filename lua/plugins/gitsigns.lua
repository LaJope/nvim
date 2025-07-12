local function keymaps(bufnr)
	local gitsigns = require("gitsigns")

	local function desc(description) return { desc = description, buffer = bufnr } end

	vim.keymap.set("n", "<leader>gf", ":Gitsigns<CR>", { desc = "Gitsigns actions" })

	-- Navigation
	local function nav_hunk(direction)
		return function() gitsigns.nav_hunk(direction) end
	end
	vim.keymap.set("n", "<leader>gn", nav_hunk("next"), desc("Move to the next git hunk"))
	vim.keymap.set("n", "<leader>gN", nav_hunk("prev"), desc("Move to the prev git hunk"))

	-- Actions
	vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, desc("Stage hovered git hunk"))
	vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, desc("Reset hovered git hunk"))

	local hunk_setup = { vim.fn.line("."), vim.fn.line("v") }
	local function stage_hunk() gitsigns.stage_hunk(hunk_setup) end
	vim.keymap.set("v", "<leader>gs", stage_hunk, desc("Stage selected git hunk"))

	local function reset_hunk() gitsigns.reset_hunk(hunk_setup) end
	vim.keymap.set("v", "<leader>gr", reset_hunk, desc("Reset selected git hunk"))

	vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, desc("Stage buffer"))
	vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, desc("Reset buffer"))
	vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, desc("Preview git hunk"))
	vim.keymap.set("n", "<leader>gi", gitsigns.preview_hunk_inline, desc("Preview git hunk inline"))

	local function blame_line() gitsigns.blame_line({ full = true }) end
	vim.keymap.set("n", "<leader>gb", blame_line, desc("Show git blame for current line"))

	local function diffthis(against)
		return function() gitsigns.diffthis(against) end
	end
	vim.keymap.set("n", "<leader>gd", diffthis(), desc("Display git diff against ingex in new buffer"))
	vim.keymap.set("n", "<leader>gD", diffthis("~"), desc("Display git diff against prev commit in new buffer"))

	local function setqflist(param)
		return function() gitsigns.setqflist(param) end
	end
	vim.keymap.set("n", "<leader>gQ", setqflist("all"), desc("Open git hunks in quickfix (All)"))
	vim.keymap.set("n", "<leader>gq", setqflist(), desc("Open git hunks in quickfix (Buffer)"))

	-- Toggles
	vim.keymap.set("n", "<leader>gtb", gitsigns.toggle_current_line_blame, desc("Toggle current line git blame"))
	vim.keymap.set("n", "<leader>gtw", gitsigns.toggle_word_diff, desc("Toggle word diff"))

	-- Text object
	vim.keymap.set({ "o", "x" }, "gi", gitsigns.select_hunk, desc("Select git hunk"))
end

local function config()
	local setup = {}
	setup.on_attach = keymaps
	require("gitsigns").setup(setup)
end

return {
	"lewis6991/gitsigns.nvim",
	config = config,
}
