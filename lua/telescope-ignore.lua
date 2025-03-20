local TSIgnore = {}

local fileName = ".TSIgnore"

TSIgnore.list = {}

function TSIgnore.setDefaultIgnore(list)
  for _, v in pairs(list) do
    table.insert(TSIgnore.list, v)
  end
end

function TSIgnore.parseIgnoreFile(path)
  if (path == nil) then
    path = vim.fn.getcwd() .. "/" .. fileName
  end

  local file = io.open(path, "r")
  if (file == nil) then
    return
  end

  for line in file:lines() do
    if (line ~= "") then
      table.insert(TSIgnore.list, line)
    end
  end
end

return TSIgnore
