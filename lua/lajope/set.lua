vim.g.loaded_netrw = 1 -- Disable NetRW screen
vim.g.loaded_netrwPlugin = 1

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdheight = 1 -- Cmd height

vim.opt.number = true -- Numberline
vim.opt.relativenumber = true -- Relative numberline
-- vim.o.statuscolumn = '%C%#CFold#%{&nu?v:lnum:""}%s' ..
--                          '%=%{&rnu&&(v:lnum%2)?v:relnum:""}' ..
--                          '%#CLineNr#%{&rnu&&!(v:lnum%2)?v:relnum:""}' ..
--                          '%{&rnu?"":"  "} '
vim.opt.numberwidth = 2 -- Width of numberline

vim.opt.textwidth = 80
vim.opt.tabstop = 2 -- Width of tabulation
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.showtabline = 2

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
vim.opt.colorcolumn = '80' -- Number of the highlighted line
vim.opt.cursorline = true

---@diagnostic disable-next-line: deprecated
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;' ..
                      'ABCDEFGHIJKLMNOPQRSTUVWXYZ,' ..
                      'фисвуапршолдьтщзйкыегмцчня;' ..
                      'abcdefghijklmnopqrstuvwxyz'

vim.o.autoread = true
vim.api.nvim_create_autocmd({
    "BufEnter", "CursorHold", "CursorHoldI", "FocusGained"
}, {command = "if mode() != 'c' | checktime | endif", pattern = {"*"}})
