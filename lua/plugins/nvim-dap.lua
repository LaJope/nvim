local function dap_keymap()
  local dap = require("dap")

  vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
  vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: continue" })
  vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: step over" })
  vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: step into" })
  vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: step out" })

  local function log_breakpoint() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end
  vim.keymap.set("n", "<leader>dlp", log_breakpoint)

  vim.keymap.set("n", "<leader>dr", dap.repl.open)
  vim.keymap.set("n", "<leader>dl", dap.run_last)
end

local function ui_keymap()
  local ui = require("dap.ui.widgets")

  vim.keymap.set({ "n", "v" }, "<leader>dh", ui.hover)
  vim.keymap.set({ "n", "v" }, "<leader>dp", ui.preview)

  local function centered_float(param)
    return function() ui.centered_float(param) end
  end
  vim.keymap.set("n", "<leader>df", centered_float(ui.frames))
  vim.keymap.set("n", "<leader>ds", centered_float(ui.scopes))
end

local function dap_config()
  dap_keymap()
  ui_keymap()
end

local function ui_config()
  local dap, dapui = require("dap"), require("dapui")

  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
  dap.listeners.before.event_terminated.dapui_config = dapui.close
  dap.listeners.before.event_exited.dapui_config = dapui.close
end

local dependencies = {
  {
    "rcarriga/nvim-dap-ui",
    config = ui_config,
  },
  "nvim-neotest/nvim-nio",
}

if true then return {} end

return {
  "mfussenegger/nvim-dap",
  dependencies = dependencies,
  config = dap_config,
  enable = false,
}
