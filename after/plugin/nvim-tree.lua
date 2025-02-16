local function ntree_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return {
            desc = 'nvim-tree:' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Toggle NvimTree help'))
end

require('nvim-tree').setup({
    on_attach = ntree_on_attach,
    view = {side = 'right'},
    filters = {
        dotfiles = true,
        custom = {
            'out', 'CMakeLists.txt', 'cmake', 'Make', 'compile_commands.json',
            'vcpkg', 'tasks.py', 'node_modules', 'package.json',
            'package-lock.json', 'README'
        },
        exclude = {'main.*', 'layout'}
    }
})
