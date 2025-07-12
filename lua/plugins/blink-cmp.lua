local keymaps = {
  preset = "none",

  ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
  ["<C-e>"] = { "hide" },
  ["<C-o>"] = { "select_and_accept" },

  ["<Up>"] = { "select_prev", "fallback" },
  ["<Down>"] = { "select_next", "fallback" },
  ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
  ["<C-n>"] = { "select_next", "fallback_to_mappings" },

  ["<C-u>"] = { "scroll_documentation_up", "fallback" },
  ["<C-d>"] = { "scroll_documentation_down", "fallback" },

  ["<C-f>"] = { "snippet_forward", "fallback" },
  ["<C-b>"] = { "snippet_backward", "fallback" },

  ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
}

---@module "blink.cmp"
---@type blink.cmp.Config
local opts = {
  keymap = keymaps,

  appearance = { nerd_font_variant = "mono" },

  completion = { documentation = { auto_show = false } },

  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
}

local dependencies = {
  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

return {
  "saghen/blink.cmp",
  dependencies = dependencies,

  version = "1.*",
  build = "cargo build --release",

  opts = opts,
  opts_extend = { "sources.default" },
}
