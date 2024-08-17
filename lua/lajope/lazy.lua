local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    tag = '0.1.8',
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      -- require("telescope").load_extension "frecency"
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'mbbill/undotree',
  'tpope/vim-fugitive',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- Manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP support
      { 'neovim/nvim-lspconfig' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp'
      },
      { 'rafamadriz/friendly-snippets' }
    }
  },

  'lervag/vimtex',
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    config = function()
      require('luasnip-latex-snippets').setup({ use_treesitter = true })
      require('luasnip').config.setup({ enable_autosnippets = true })
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'lukas-reineke/indent-blankline.nvim',
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  },

  'mfussenegger/nvim-dap',
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap'
    },
    opt = {
      handlers = {},
    }
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap'
    },
  },

  'lewis6991/gitsigns.nvim',
  {
    'akinsho/bufferline.nvim',
    version = '*'
  },

  'nvim-lualine/lualine.nvim',

  'tpope/vim-obsession',
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = "Trouble"
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
      require('which-key').setup()
    end
  },
  'Civitasv/cmake-tools.nvim',

  'ojroques/nvim-bufdel',
  'xiyaowong/transparent.nvim',
  'sitiom/nvim-numbertoggle',
  'rcarriga/nvim-notify',
  'onsails/lspkind.nvim',
  -- 'nolanderc/glsl_analyzer',
  --'tikhomirov/vim-glsl'
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { { 'kevinhwang91/promise-async' } }
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = { { 'MunifTanjim/nui.nvim' } }
  },

  'ncm2/float-preview.nvim',

  {
    'mistricky/codesnap.nvim',
    build = 'make'
  },


  'sainnhe/gruvbox-material',

  {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
}

local opts = {}

require('lazy').setup(plugins, opts)
