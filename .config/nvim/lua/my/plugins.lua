return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "EdenEast/nightfox.nvim"
  use "nvim-tree/nvim-web-devicons"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
end)
