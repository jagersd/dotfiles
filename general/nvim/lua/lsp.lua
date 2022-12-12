local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'emmet_ls',
  'cssls',
  'tsserver',
  'gopls',
  'sumneko_lua',
  'phpactor',
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
      focusable = false,
      border = "single"
  }
)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

require('nvim-treesitter.configs').setup {
  ensure_installed = {'go', 'php', 'javascript'},
  highlight = {enable = true},
}

vim.o.updatetime = 300
--vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[autocmd! CursorHold *.go,*.php,*.js,*.vue lua vim.lsp.buf.hover()]]
