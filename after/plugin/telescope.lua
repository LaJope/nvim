local telescope = require('telescope')
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      'out/*',
      'vcpkg*',
      '*cmake-tools&',
      'Resources/*',
      'CMakeFiles/*',
      'MakeFiles',
      'cmake_install.cmake'
    }
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
