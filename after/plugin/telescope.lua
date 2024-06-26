require('telescope').setup({
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
  }
})
