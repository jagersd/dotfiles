local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'emmet_ls',
  'cssls',
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

vim.o.updatetime = 500
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

