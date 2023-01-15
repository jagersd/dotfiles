vim.g.mapleader = ","

require('vars')
require('opts')
require('keys')
require('plug')


require('nvim-tree').setup()
require('nvim-autopairs').setup()
require('lualine').setup()
require('colorizer').setup()

require('lsp')
