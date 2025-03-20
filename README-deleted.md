# after dir
## vimtex.lua
```lua
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
  aux_dir = "tmp",
  out_dir = "tmp"
}
```

# lazy.lua
```lua
"lervag/vimtex",
{
    "iurimateus/luasnip-latex-snippets.nvim",
    config = function()
    require("luasnip-latex-snippets").setup({ use_treesitter = true })
    require("luasnip").config.setup({ enable_autosnippets = true })
    end,
},
{
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
},
{
    "GR3YH4TT3R93/zellij-nav.nvim",
    cond = os.getenv("ZELLIJ") == "0",
    event = "VeryLazy",
    init = function()
        vim.g.zellij_nav_default_mappings = false
    end,
    opts = {},
    keys = {
        { "<C-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true, desc = "trash" } },
        { "<C-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true } },
        { "<C-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true } },
        { "<C-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true } },
        { "<C-n>", "<cmd>ZellijNewPane<CR>", { silent = true } },
        { "<C-s>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true } },
        { "<C-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true } },
        { "<C-x>", "<cmd>ZellijClosePane<CR>", { silent = true } },
        { "<C-t>", "<cmd>ZellijNewTab<CR>", { silent = true } },
    },
},
```

# remap.lua
```lua
-- Vimtex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile latex document in continuous mode" })
vim.keymap.set("n", "<leader>la", "<cmd>VimtexContextMenu<CR>", { desc = "Open vimtex context menu" })
vim.keymap.set("n", "<leader>lq", "<cmd>VimtexClean<CR>", { desc = "Clean vimtex compiler" })
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "Show vimtex errors" })
vim.keymap.set("n", "<leader>lg", "<cmd>VimtexStatus<CR>", { desc = "Show vimtex compiler status" })
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>", { desc = "Show vimtex info" })
vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { desc = "Stop vimtex compiler" })
vim.keymap.set("n", "<leader>lK", "<cmd>VimtexStopAll<CR>", { desc = "Stop vimtex (everything)" })
vim.keymap.set({ "n", "v" }, "<leader>lcs", "<cmd>VimtexCompileSelected<CR>", { desc = "Compile selected" })
vim.keymap.set("n", "<leader>lco", "<cmd>VimtexCompileOutput<CR>", { desc = "Show vimtex compile output" })
vim.keymap.set("n", "<leader>lI", "<cmd>VimtexImapsList<CR>", { desc = "Show vimtex imaps list" })
vim.keymap.set("n", "<leader>ls", "<cmd>VimtexLog<CR>", { desc = "Show vimtex log" })
vim.keymap.set("n", "<leader>lm", "<cmd>VimtexToggleMain<CR>", { desc = "Toggle vimtex main" })
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocOpen<CR>", { desc = "Open vimtex toc" })
vim.keymap.set("n", "<leader>lT", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle vimtex toc" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "Open vimtex pdf viewer" })
vim.keymap.set("n", "<leader>lx", "<cmd>VimtexReload<CR>", { desc = "Reload vimtex plugin" })
vim.keymap.set("n", "<leader>lX", "<cmd>VimtexReloadState<CR>", { desc = "Reload vimtex state" })
```
