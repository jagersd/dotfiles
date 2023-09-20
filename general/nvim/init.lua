vim.g.mapleader = ","

require('plug')
require('vars')
require('opts')
require('keys')

require('nvim-tree').setup()
require('nvim-autopairs').setup()
require('lualine').setup()
require('colorizer').setup()

require('lsp')
