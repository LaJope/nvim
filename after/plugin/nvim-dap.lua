local dap = require('dap')

dap.adapters.executable = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
  name = 'lldb1',
  host = '127.0.0.1',
  port = 13000
}

dap.adapters.codelldb = {
  name = "codelldb server",
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },
  }
}

function Scandir(directory)
  local ind = 0
  local exe_paths = {}
  local popen = io.popen

  local proj_dirs = popen('ls -1 "' .. directory .. '" 2> /dev/null')
  if (proj_dirs == nil) then
    do
      ind = ind + 1
      exe_paths[ind] = 0
      return exe_paths
    end
  end

  for dir in proj_dirs:lines() do
    local proj_execs = popen('ls -1 "' .. directory .. '/' .. dir .. '" 2> /dev/null')
    if (proj_execs == nil) then
      do
        ind = ind + 1
        exe_paths[ind] = 1
        return exe_paths
      end
    end

    for exec in proj_execs:lines() do
      if (dir == exec) then
        exe_paths[dir] = exec
      end
    end
    proj_execs:close()
  end
  proj_dirs:close()

  return exe_paths
end

dap.configurations.cpp = {
  {
    name = "Launch executable",
    type = "codelldb",
    request = "launch",
    program = function()
      local dir = vim.fn.getcwd() .. '/out/Debug/'
      -- local execs = Scandir(dir)
      -- for ind, item in ipairs(execs) do
      --   vim.print(ind .. ' ' .. item)
      -- end
      -- local input = tonumber(vim.fn.input('Choose executable: '))
      local input = vim.fn.input('Enter project name: ')
      -- return dir .. execs[input] .. '/' .. execs[input]
      return dir..input..'/'..input
    end,
    cwd = "${workspaceFolder}",
    terminal = 'integrated',
    -- sourceLanguages = { 'c++' },
    stopOnEntry = false,
    showDisassembly = "never",
  }
}
