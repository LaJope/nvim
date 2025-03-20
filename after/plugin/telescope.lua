local ignore = require("telescope-ignore")

ignore.setDefaultIgnore({
  'out/*',
  'vcpkg*',
  '*cmake-tools&',
  'CMakeFiles/*',
  'MakeFiles',
  'cmake_install.cmake'
})

ignore.parseIgnoreFile()

local telescope = require('telescope')
telescope.setup({
  defaults = {
    file_ignore_patterns = ignore.list
  },
  extensions = {
    frecency = {
      auto_validate = false,
      matcher = "fuzzy",
      path_display = { "filename_first" },
    },
  }
})

telescope.load_extension('frecency')
