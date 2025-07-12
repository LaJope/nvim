CONFIG_PATH = os.getenv("HOME") .. "/.config/nvim"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdheight = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.textwidth = 80

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.showtabline = 2

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;' ..
                      'ABCDEFGHIJKLMNOPQRSTUVWXYZ,' ..
                      'фисвуапршолдьтщзйкыегмцчня;' ..
                      'abcdefghijklmnopqrstuvwxyz'

vim.o.autoread = true

vim.api.nvim_create_autocmd(
  { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
  {
    callback = function()
      local bufnr = tonumber(vim.fn.expand "<abuf>")
      if not bufnr then return end
      local name = vim.api.nvim_buf_get_name(bufnr)
      if
        name == ""
        or vim.bo[bufnr].buftype ~= ""
        or not vim.fn.filereadable(name)
      then
        return
      end
      vim.cmd(bufnr .. "checktime")
    end,
    pattern = {"*"}
  }
)
