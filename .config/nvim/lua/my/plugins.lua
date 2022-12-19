return require("packer").startup(function(use)
  -- Base
  use "wbthomason/packer.nvim"
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
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-gps" }
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons"
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-github.nvim" },
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    requires = "kkharji/sqlite.lua"
  }

  -- Window picker
  use {
    "s1n7ax/nvim-window-picker",
    tag = "v1.*",
  }

  -- Filer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    }
  }

  -- Indent guide
  use {
    "lukas-reineke/indent-blankline.nvim"
  }

  -- Teminal extension
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
  }

  -- Scrollbar
  use "petertriho/nvim-scrollbar"
  use {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup {}
    end,
  }
end)
