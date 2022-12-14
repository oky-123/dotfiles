return require("packer").startup(function(use)
  -- Base
  use "wbthomason/packer.nvim"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"
  use "EdenEast/nightfox.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- Status/Bufferline
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-gps' }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim'
  }
end)
