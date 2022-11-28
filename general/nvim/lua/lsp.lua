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

lsp.setup_nvim_cmp({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  }
})

lsp.setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = {'go', 'php', 'javascript'},
  highlight = {enable = true},
}

vim.o.updatetime = 500
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

