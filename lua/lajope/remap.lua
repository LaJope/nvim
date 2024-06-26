vim.g.mapleader = ' '


-- Basic
vim.keymap.set('n', '<C-s>', vim.cmd.w, { desc = 'Save current file' })
vim.keymap.set('n', '<leader><leader>', '<cmd>so<CR>', { desc = 'Source current file' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make the current file executable' })


-- Unbind
vim.keymap.set('n', '<A-s>', '<nop>', { desc = 'Unbind Alt-s' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Unbind Q' })


-- Navigate within insert mode
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to the beggining of the line (insert mode)' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to the end of the line (insert mode)' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left (insert mode)' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right (insert mode)' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down (insert mode)' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up (insert mode)' })


-- Swith between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Switch to right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Switch to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Switch to upper window' })


-- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move the line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move the line up' })


-- Vimtex
vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<CR>',
  { desc = 'Compile latex document in continuous mode' })
vim.keymap.set('n', '<leader>la', '<cmd>VimtexContextMenu<CR>',
  { desc = 'Open vimtex context menu' })
vim.keymap.set('n', '<leader>lq', '<cmd>VimtexClean<CR>',
  { desc = 'Clean vimtex compiler' })
vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>',
  { desc = 'Show vimtex errors' })
vim.keymap.set('n', '<leader>lg', '<cmd>VimtexStatus<CR>',
  { desc = 'Show vimtex compiler status' })
vim.keymap.set('n', '<leader>li', '<cmd>VimtexInfo<CR>',
  { desc = 'Show vimtex info' })
vim.keymap.set('n', '<leader>lk', '<cmd>VimtexStop<CR>',
  { desc = 'Stop vimtex compiler' })
vim.keymap.set('n', '<leader>lK', '<cmd>VimtexStopAll<CR>',
  { desc = 'Stop vimtex (everything)' })
vim.keymap.set({ 'n', 'v' }, '<leader>lcs', '<cmd>VimtexCompileSelected<CR>',
  { desc = 'Compile selected' })
vim.keymap.set('n', '<leader>lco', '<cmd>VimtexCompileOutput<CR>',
  { desc = 'Show vimtex compile output' })
vim.keymap.set('n', '<leader>lI', '<cmd>VimtexImapsList<CR>',
  { desc = 'Show vimtex imaps list' })
vim.keymap.set('n', '<leader>ls', '<cmd>VimtexLog<CR>',
  { desc = 'Show vimtex log' })
vim.keymap.set('n', '<leader>lm', '<cmd>VimtexToggleMain<CR>',
  { desc = 'Toggle vimtex main' })
vim.keymap.set('n', '<leader>lt', '<cmd>VimtexTocOpen<CR>',
  { desc = 'Open vimtex toc' })
vim.keymap.set('n', '<leader>lT', '<cmd>VimtexTocToggle<CR>',
  { desc = 'Toggle vimtex toc' })
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>',
  { desc = 'Open vimtex pdf viewer' })
vim.keymap.set('n', '<leader>lx', '<cmd>VimtexReload<CR>',
  { desc = 'Reload vimtex plugin' })
vim.keymap.set('n', '<leader>lX', '<cmd>VimtexReloadState<CR>',
  { desc = 'Reload vimtex state' })


-- Move up and own by half page
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down by half page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up by half page' })


-- Move to the next searched word
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Move to the next searched word' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to the previous searched word' })


-- Copy and paste
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste text without overriding clipboard' })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Copy to the global buffer +y' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Copy to the global buffer +Y' })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Delete without copying' })


-- Trouble
local trouble = require('trouble')
vim.keymap.set('n', '<leader>tt', function() trouble.toggle() end, { desc = 'Toggle default Trouble diagnostic window' })
vim.keymap.set('n', '<leader>tw', function() trouble.toggle('workspace_diagnostics') end,
  { desc = 'Toggle trouble workspace diagnostic window' })
vim.keymap.set('n', '<leader>td', function() trouble.toggle('document_diagnostics') end,
  { desc = 'Toggle trouble document diagnostic window' })
vim.keymap.set('n', '<leader>tq', function() trouble.toggle('quickfix') end, { desc = 'Toggle trouble quickfix' })
vim.keymap.set('n', '<leader>tl', function() trouble.toggle('loclist') end, { desc = 'Toggle trouble loclist' })
vim.keymap.set('n', 'tR', function() trouble.toggle('lsp_references') end, { desc = 'Toggle trouble lsp references' })


-- Colorscheme
vim.keymap.set('n', '<leader>cot', vim.cmd.TransparentToggle, { desc = 'Toggle transparency of the UI' })


-- Finecmd
vim.api.nvim_set_keymap('n', '<leader>:', ':', { noremap = true, desc = 'Ordinary cmd' })
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, desc = 'Fine cmd' })


-- Formating with LSP
vim.keymap.set('n', '<leader>f', function()
  if vim.fn.exists(':LspZeroFormat') == 1 then
    vim.cmd('LspZeroFormat')
  else
    vim.lsp.buf.format()
  end
end, { desc = 'Format code with LspZeroFormat or LSP' })


-- Rename
vim.keymap.set("v", "<leader>s", [[:s///gI<Left><Left><Left><Left>]],
  { desc = 'Rename every enstance of some word in the selected area' })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Rename every enstance of the word in the file' })


-- Split window
vim.keymap.set('n', '<leader>wm', vim.cmd.sp, { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', vim.cmd.vs, { desc = 'Split window vertically' })


-- fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Open buffer with git info' })


-- Nvim-tree
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle, { desc = 'Open NvimTree' })
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFocus, { desc = 'Focus on NvimTree' })


-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open UndoTree' })
vim.keymap.set('n', '<leader>i', vim.cmd.UndotreeFocus, { desc = 'Focus on UndoTree' })


-- Comment
vim.keymap.set('n', '<leader>/', function() require("Comment.api").toggle.linewise.current() end,
  { desc = 'Comment current line' })
vim.keymap.set('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Comment selected lines' })


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Open telescope file search' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Open telescope git file search' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Open telescope word search' })
vim.keymap.set("n", "<leader>pe", "<Cmd>Telescope frecency workspace=CWD<CR>")


-- Cmake-tools
vim.keymap.set('n', '<leader>cmg', vim.cmd.CMakeGenerate,
  { desc = 'Run CMakeGenerate' })

vim.keymap.set('n', '<leader>cmb', function()
  vim.cmd('silent !inv updateSrc')
  vim.cmd('CMakeBuild')
end, { desc = 'Run CMakeBuild with updating source files' })

vim.keymap.set('n', '<leader>cmt', vim.cmd.CMakeSelectBuildTarget,
  { desc = 'Change build target' })

vim.keymap.set('n', '<leader>cmp', function()
  vim.cmd('CMakeSelectBuildTarget')
  vim.cmd('CMakeBuild')
end, { desc = 'Change build target and build' })


-- Bufferline
-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>')

-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>')
vim.keymap.set('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>')

-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufDel<CR>')


-- Buffer resize
vim.keymap.set('n', '<S-Up>', '<cmd>resize +5<CR>')
vim.keymap.set('n', '<S-Down>', '<cmd>resize -5<CR>')
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -5<CR>')

vim.keymap.set('n', '<C-S-Up>', '<cmd>resize +1<CR>')
vim.keymap.set('n', '<C-S-Down>', '<cmd>resize -1<CR>')
vim.keymap.set('n', '<C-S-Right>', '<cmd>vertical resize +1<CR>')
vim.keymap.set('n', '<C-S-Left>', '<cmd>vertical resize -1<CR>')


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
