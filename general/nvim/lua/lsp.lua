local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
  'emmet_ls',
  'cssls',
  'tsserver',
  'gopls',
  'intelephense'
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
  ensure_installed = {'go', 'php', 'javascript','vue'},
  highlight = {enable = true},
  indent = {enable = true}
}

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})

vim.o.updatetime = 300
--vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd! CursorHold *.go,*.php,*.js lua vim.lsp.buf.hover()]]

local hoverGrp = vim.api.nvim_create_augroup("ShowHover", {clear = true})

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = {"*.vue,*.css,*.html,*.go,*.lua,*.php,*.py,*.sh"},
    command = "lua vim.lsp.buf.hover()",
    group = hoverGrp,
})
