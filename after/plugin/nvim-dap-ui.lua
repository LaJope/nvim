local dap = require('dap')
local dapui = require('dapui')
dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.7
        },
        {
          id = "breakpoints",
          size = 0.15
        },
        {
          id = "stacks",
          size = 0.15
        },
        -- {
        --   id = "watches",
        --   size = 0.25
        -- }
      },
      position = "left",
      size = 70
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "bottom",
      size = 10
    }
  }
})

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
