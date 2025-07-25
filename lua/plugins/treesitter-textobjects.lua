local select_keymaps = {
  ["a="]={ query="@assignment.outer", desc="Select outer part of an assignment" },
  ["i="]={ query="@assignment.inner", desc="Select inner part of an assignment" },
  ["t="]={ query="@assignment.lhs", desc="Select left hand side of an assignment" },
  ["r="]={ query="@assignment.rhs", desc="Select right hand side of an assignment" },
  ["aa"]={ query="@parameter.outer", desc="Select outer part of a parameter/argument" },
  ["ia"]={ query="@parameter.inner", desc="Select inner part of a parameter/argument" },
  ["ai"]={ query="@conditional.outer", desc="Select outer part of a conditional" },
  ["ii"]={ query="@conditional.inner", desc="Select inner part of a conditional" },
  ["al"]={ query="@loop.outer", desc="Select outer part of a loop" },
  ["il"]={ query="@loop.inner", desc="Select inner part of a loop" },
  ["af"]={ query="@call.outer", desc="Select outer part of a function call" },
  ["if"]={ query="@call.inner", desc="Select inner part of a function call" },
  ["am"]={ query="@function.outer", desc="Select outer part of a method/function definition" },
  ["im"]={ query="@function.inner", desc="Select inner part of a method/function definition" },
  ["ac"]={ query="@class.outer", desc="Select outer part of a class" },
  ["ic"]={ query="@class.inner", desc="Select inner part of a class" },
}

local swap_keymaps = {
  next = {
    ["<leader>na"]={ query="@parameter.inner", desc="Swap param/args with next" },
    ["<leader>nm"]={ query="@function.outer", desc="Swap function with next" },
  },
  previous = {
    ["<leader>pa"]={ query="@parameter.inner", desc="Swap params/args with prev" },
    ["<leader>pm"]={ query="@function.outer", desc="Swap function with prev" },
  },
}

local move_keymaps = {
  next_start = {
    ["]f"]={ query="@call.outer", desc="Next function call start" },
    ["]m"]={ query="@function.outer", desc="Next method/function def start" },
    ["]c"]={ query="@class.outer", desc="Next class start" },
    ["]i"]={ query="@conditional.outer", desc="Next conditional start" },
    ["]l"]={ query="@loop.outer", desc="Next loop start" },

    ["]s"]={ query="@scope", query_group="locals", desc="Next scope" },
    ["]z"]={ query="@fold", query_group="folds", desc="Next fold" },
  },
  next_end={
    ["]F"]={ query="@call.outer", desc="Next function call end" },
    ["]M"]={ query="@function.outer", desc="Next method/function def end" },
    ["]C"]={ query="@class.outer", desc="Next class end" },
    ["]I"]={ query="@conditional.outer", desc="Next conditional end" },
    ["]L"]={ query="@loop.outer", desc="Next loop end" },
  },
  prev_start={
    ["[f"]={ query="@call.outer", desc="Prev function call start" },
    ["[m"]={ query="@function.outer", desc="Prev method/function def start" },
    ["[c"]={ query="@class.outer", desc="Prev class start" },
    ["[i"]={ query="@conditional.outer", desc="Prev conditional start" },
    ["[l"]={ query="@loop.outer", desc="Prev loop start" },
  },
  prev_end={
    ["[F"]={ query="@call.outer", desc="Prev function call end" },
    ["[M"]={ query="@function.outer", desc="Prev method/function def end" },
    ["[C"]={ query="@class.outer", desc="Prev class end" },
    ["[I"]={ query="@conditional.outer", desc="Prev conditional end" },
    ["[L"]={ query="@loop.outer", desc="Prev loop end" },
  },
}

local function repeat_move()
  local trm = require("nvim-treesitter.textobjects.repeatable_move")

  vim.keymap.set({ "n", "x", "o" }, ":", trm.repeat_last_move,
    { desc="Repeat treesitter-textobject last action" })
  vim.keymap.set({ "n", "x", "o" }, ",", trm.repeat_last_move_opposite,
    { desc="Repeat treesitter-textobject last action" })

  vim.keymap.set({ "n", "x", "o" }, "f", trm.builtin_f_expr {expr = true},
    { desc="Repeat last f action" })
  vim.keymap.set({ "n", "x", "o" }, "F", trm.builtin_F_expr {expr = true},
    { desc="Repeat last F action" })

  vim.keymap.set({ "n", "x", "o" }, "t", trm.builtin_t_expr {expr = true},
    { desc="Repeat treesitter-textobject last action" })
  vim.keymap.set({ "n", "x", "o" }, "T", trm.builtin_T_expr {expr = true},
    { desc="Repeat treesitter-textobject last action" })
end

local ts_setup = {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = select_keymaps,
    },
    swap = {
      enable = true,
      swap_next = swap_keymaps.next,
      swap_previous = swap_keymaps.previous,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = move_keymaps.next_start,
      goto_next_end = move_keymaps.next_end,
      goto_previous_start = move_keymaps.prev_start,
      goto_previous_end = move_keymaps.prev_end,
    },
  },
}

local function config()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup(ts_setup)
  repeat_move()
end

return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = { "BufReadPre", "BufNewFile" },
  --config = config,
}
