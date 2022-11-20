return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', 
    },
  }
  use "windwp/nvim-autopairs"

  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}


  -- themes
  use "EdenEast/nightfox.nvim"
end)


