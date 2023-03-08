return require('packer').startup(function(use)
  -- navigation
  use 'wbthomason/packer.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'windwp/nvim-autopairs'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
    }
  use {"akinsho/toggleterm.nvim", tag = '2.4.0', config = function()
    require("toggleterm").setup()
  end}
--tabs
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
  --colorizer
  use 'norcalli/nvim-colorizer.lua'
  --lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- themes
  use "EdenEast/nightfox.nvim"
  use { "ellisonleao/gruvbox.nvim" }
  use { "kabouzeid/nvim-jellybeans", requires = "rktjmp/lush.nvim" }
  use { "sainnhe/everforest" }
  use { "catppuccin/nvim", as = "catppuccin" }

end)


