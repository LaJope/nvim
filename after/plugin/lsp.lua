local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end,
    vim.tbl_extend('force', opts, { desc = 'Go to definition' }))

  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end,
    vim.tbl_extend('force', opts, { desc = 'Info about hovering object' }))

  vim.keymap.set('n', 'L', function() vim.lsp.buf.signature_help() end,
    vim.tbl_extend('force', opts, { desc = 'Open signature help' }))

  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end,
    vim.tbl_extend('force', opts, { desc = 'List all the objects(symbols) in the file' }))

  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end,
    vim.tbl_extend('force', opts, { desc = 'Open floating error info' }))

  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end,
    vim.tbl_extend('force', opts, { desc = 'Go to previous error' }))

  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end,
    vim.tbl_extend('force', opts, { desc = 'Go to next error' }))

  vim.keymap.set('n', '<leader>vi', function() vim.lsp.buf.code_action() end,
    vim.tbl_extend('force', opts, { desc = 'Select an available code action' }))

  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end,
    vim.tbl_extend('force', opts, { desc = 'List all references to the object(symbol)' }))

  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end,
    vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))

  vim.keymap.set('i', '<C-u>', function() vim.lsp.buf.signature_help() end,
    vim.tbl_extend('force', opts, { desc = 'Open signature help in insert mode' }))

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=235 guibg=#4b6769
      hi! LspReferenceText cterm=bold ctermbg=235 guibg=#4b6769
      hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=#4b6769
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {})
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = 0,
      callback = vim.lsp.buf.clear_references,
    })
  end
end)

lsp_zero.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})


local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  ---@diagnostic disable-next-line: undefined-global
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    'clangd',
    '--offset-encoding=utf-16',
  },
}

-- require('lspconfig').glsl_analyzer.setup({
--   filetypes = { 'glsl', 'vert', 'frag', 'conf' },
--   cmd = { '/home/lajope/.local/bin/glsl_analyzer' }
-- })

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    -- 'clang-format',
    -- 'codelldb'
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-o>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
