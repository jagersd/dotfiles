local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'gopls',
  'sumneko_lua',
  'intelephense',
})

lsp.nvim_workspace()

lsp.setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = {'go', 'php', 'javascript'},
  highlight = {enable = true},
}

