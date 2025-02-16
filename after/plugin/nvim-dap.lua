local dap = require('dap')
-- require('dap-go').setup()

dap.adapters.executable = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
  name = 'lldb1',
  host = '127.0.0.1',
  port = 13000
}

dap.adapters.codelldb = {
  name = 'codelldb server',
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = { '--port', '${port}' },
  }
}

dap.configurations.cpp = {
  {
    name = 'Launch executable',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/out', 'file')
    end,
    cwd = '${workspaceFolder}',
    terminal = 'integrated',
    stopOnEntry = false,
    showDisassembly = 'never',
  }
}


dap.adapters.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6005,
}

dap.configurations.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'Launch scene',
    roject = '${workspaceFolder}',
    launch_scene = true,
  }
}
