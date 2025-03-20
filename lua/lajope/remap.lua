vim.g.mapleader = " "

-- Alpha
vim.keymap.set("n", "<leader>pa", vim.cmd.Alpha, { desc = "Open startup screen" })

-- Visualmode
vim.keymap.set("v", "$", "g_", { desc = "Select to the end of the line excluding newline symbol" })

vim.keymap.set("n", "<leader>qf", "<cmd>cclose<CR>", { desc = "Close quickfix" })

-- Terminal emulator
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })

-- Toggleterm
vim.keymap.set({ "n", "t" }, "<C-q>", vim.cmd.ToggleTerm, { desc = "Toggle terminal pane" })

-- Basic
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save current file" })
vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make the current file executable" })
vim.keymap.set("n", "<leader>qq", "<cmd>:qa<CR>", { desc = "Quit neovim altogether (warns when unsaved)" })
vim.keymap.set("n", "<leader>qy", "<cmd>:qa!<CR>", { desc = "Quit neovim altogether (without warning)" })

-- Unbind
vim.keymap.set("n", "<A-s>", "<nop>", { desc = "Unbind Alt-s" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Unbind Q" })

vim.keymap.set("n", "<A-x>", "<cmd>:q<CR>", { desc = "Close current window" })

-- Nvim devcontainer
vim.keymap.set("n", "<leader>ns", vim.cmd.DevcontainerStart,
  { desc = "Start whatever using devcontainer.json" })
vim.keymap.set("n", "<leader>na",
  function()
    require('lualine').hide({
      place = { 'statusline', 'tabline', 'winbar' },
      unhide = false,
    })

    require("statuscol").setup({
      ft_ignore = { "*" },
      segments = {
      },
    }
    )

    vim.opt.cmdheight = 0
    vim.opt.showtabline = 0
    vim.opt.relativenumber = false
    vim.opt.number = false
    vim.cmd("DevcontainerAttach")
  end,
  { desc = "Attach to whatever in devcontainer.json" })
vim.keymap.set("n", "<leader>ne", vim.cmd.DevcontainerExec,
  { desc = "Execute a single command on container in devcontainer.json" })
vim.keymap.set("n", "<leader>np", vim.cmd.DevcontainerStop,
  { desc = "Stop whatever was started based on devcontainer.json" })
vim.keymap.set("n", "<leader>nxy", vim.cmd.DevcontainerStopAll,
  { desc = "Stop everything started with this plugin (in current session)" })
vim.keymap.set("n", "<leader>nry", vim.cmd.DevcontainerRemoveAll,
  { desc = "Remove everything started with this plugin (in current session)" })
vim.keymap.set("n", "<leader>nl", vim.cmd.DevcontainerLogs,
  { desc = "Open plugin log file" })
vim.keymap.set("n", "<leader>nc", vim.cmd.DevcontainerEditNearestConfig,
  { desc = "Opens nearest/creates devcontainer.json" })


-- Navigate within insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Go to the beggining of the line (insert mode)" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to the end of the line (insert mode)" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left (insert mode)" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right (insert mode)" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down (insert mode)" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up (insert mode)" })

-- Swith between windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Switch to left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Switch to right window' })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Switch to upper window' })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Switch to lower window' })

-- Tmux + nvim navigations
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Switch to left window/tmux pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Switch to right window/tmux pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Switch to upper window/tmux pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Switch to lower window/tmux pane" })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the line up" })

-- Nvim dap
vim.keymap.set("n", "mr", "<cmd>DapContinue<CR>", { desc = "End the debbug" })
vim.keymap.set("n", "mb", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at current line" })
vim.keymap.set("n", "mi", "<cmd>DapStepInto<CR>", { desc = "Debbuger step into" })
vim.keymap.set("n", "mu", "<cmd>DapStepOut<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "mo", "<cmd>DapStepOver<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "mq", "<cmd>DapTerminate<CR>", { desc = "Terminate debugger" })

-- Move up and own by half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down by half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up by half page" })

-- Move to the next searched word
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to the next searched word" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous searched word" })

-- Copy and paste
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste text without overriding clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to the global buffer +y" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to the global buffer +Y" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

vim.keymap.set(
  "n",
  "<leader>tb",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" }
)

vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })

vim.keymap.set(
  "n",
  "<leader>tl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" }
)

vim.keymap.set("n", "<leader>tp", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })

vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Finecmd
vim.api.nvim_set_keymap("n", "<leader>:", ":", { noremap = true, desc = "Ordinary cmd" })
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true, desc = "Fine cmd" })

-- Formating with LSP or formatter
vim.keymap.set("n", "<leader>f", function()
  if vim.fn.exists(":LspZeroFormat") == 2 then
    vim.cmd("LspZeroFormat")
  else
    require("conform").format()
  end
end, { desc = "Format code with LspZeroFormat or LSP" })

-- Rename
vim.keymap.set(
  "v",
  "<leader>s",
  [[:s///gI<Left><Left><Left><Left>]],
  { desc = "Rename every enstance of some word in the selected area" }
)
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Rename every enstance of the word in the file" }
)

-- Split window
vim.keymap.set("n", "<leader>wm", vim.cmd.sp, { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wv", vim.cmd.vs, { desc = "Split window vertically" })

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open buffer with git info" })

-- Nvim-tree
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle, { desc = "Open NvimTree" })
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus, { desc = "Focus on NvimTree" })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open UndoTree" })

-- Comment
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment current line" })
vim.keymap.set(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment selected lines" }
)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pe", builtin.find_files, { desc = "Open telescope file search" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Open telescope git file search" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Open telescope word search" })
vim.keymap.set(
  "n",
  "<leader>pf",
  "<Cmd>Telescope frecency workspace=CWD<CR>",
  { desc = "Open telescope frecency file search" }
)

-- Cmake-tools
vim.keymap.set("n", "<leader>cg", function()
  vim.cmd("silent !inv updateSrc")
  vim.cmd("CMakeGenerate")
end, { desc = "Run CMakeGenerate with updating source files" })

vim.keymap.set("n", "<leader>cb", function()
  vim.cmd("silent !inv updateSrc")
  vim.cmd("CMakeBuild")
end, { desc = "Run CMakeBuild with updating source files" })

vim.keymap.set("n", "<leader>csb", vim.cmd.CMakeSelectBuildTarget, { desc = "Change build target" })

vim.keymap.set("n", "<leader>cp", function()
  vim.cmd("CMakeSelectBuildTarget")
  vim.cmd("CMakeBuild")
end, { desc = "Change build target and build" })

vim.keymap.set("n", "<leader>cst", vim.cmd.CMakeSelectBuildType, { desc = "Change build type" })

vim.keymap.set("n", "<leader>cr", function()
  vim.cmd("CMakeSelectLaunchTarget")
  vim.cmd("CMakeDebug")
end, { desc = "Toggle the state of the debugger" })

-- Bufferline
-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>")

-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>")

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufDel<CR>")

-- Buffer resize
vim.keymap.set("n", "<S-Up>", "<cmd>resize +5<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -5<CR>")

vim.keymap.set("n", "<C-A-K>", "<cmd>resize +5<CR>")
vim.keymap.set("n", "<C-A-J>", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<C-A-L>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<C-A-H>", "<cmd>vertical resize -5<CR>")

-- Live Server
vim.keymap.set("n", "<leader>hs", vim.cmd.LiveServerStart, { desc = "Start live server in project directory" })
vim.keymap.set("n", "<leader>hp", vim.cmd.LiveServerStop, { desc = "Stop live server in project directory" })

-- Comment (default mappings)
--
-- NORMAL MODE
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
--
-- VISUAL MODE
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment
--
-- # Linewise
--
-- `gcw` - Toggle from the current cursor position to the next word
-- `gc$` - Toggle from the current cursor position to the end of line
-- `gc}` - Toggle until the next blank line
-- `gc5j` - Toggle 5 lines after the current cursor position
-- `gc8k` - Toggle 8 lines before the current cursor position
-- `gcip` - Toggle inside of paragraph
-- `gca}` - Toggle around curly brackets
--
-- # Blockwise
--
-- `gb2}` - Toggle until the 2 next blank line
-- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
-- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)

-- Lsp
--
--  ("n", "gd", vim.lsp.buf.definition())
--  ("n", "K", vim.lsp.buf.hover())
--  ("n", "<leader>vws", vim.lsp.buf.workspace_symbol())
--  ("n", "<leader>vd", vim.diagnostic.open_float())
--  ("n", "[d", vim.diagnostic.goto_next())
--  ("n", "]d", vim.diagnostic.goto_prev())
--  ("n", "<leader>vca", vim.lsp.buf.code_action())
--  ("n", "<leader>vrr", vim.lsp.buf.references())
--  ("n", "<leader>vrn", vim.lsp.buf.rename())
--  ("i", "<C-u>", vim.lsp.buf.signature_help())
--
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-o>'] = cmp.mapping.confirm({ select = true });
--  ['<C-Space>'] = cmp.mapping.complete(),
--
--  ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--  ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--  ['<C-d>'] = cmp.mapping.scroll_docs(4),
