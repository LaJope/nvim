-- Basic
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save current file" })
vim.keymap.set("n", "<leader><leader>", "<cmd>so %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make the current file executable" })

-- Unbind
vim.keymap.set("n", "<A-s>", "<nop>", { desc = "Unbind Alt-s" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Unbind Q" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit neovim altogether (warns when unsaved)" })
vim.keymap.set("n", "<leader>qy", "<cmd>qa!<CR>", { desc = "Quit neovim altogether (without warning)" })

vim.keymap.set("n", "<A-x>", "<cmd>q<CR>", { desc = "Close current window" })

-- Visualmode
vim.keymap.set("v", "$", "g_", { desc = "Select to line end excluding newline symbol" })

-- Navigate within insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Go to the line beggining (insert mode)" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to the line end (insert mode)" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left (insert mode)" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right (insert mode)" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down (insert mode)" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up (insert mode)" })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the line up" })

-- Move up and own by half page and center on line
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down by half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up by half page" })

-- Move to the next searched word
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to the next searched word" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous searched word" })

-- Paste and delete lines
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste text without overriding clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- Substitute
local visual_rename = [[:s///gI<Left><Left><Left><Left>]]
vim.keymap.set("v", "<leader>s", visual_rename, { desc = "Open s/// (visual)" })
local normal_rename = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
vim.keymap.set("n", "<leader>s", normal_rename, { desc = "Open s/// (normal)" })

-- Split window
vim.keymap.set("n", "<leader>wm", vim.cmd.sp, { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wv", vim.cmd.vs, { desc = "Split window vertically" })

-- Buffer resize
vim.keymap.set("n", "<S-Up>", "<cmd>resize +5<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -5<CR>")

vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +1<CR>")
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -1<CR>")
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -1<CR>")
