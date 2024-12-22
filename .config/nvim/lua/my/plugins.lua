return require("packer").startup(function(use)
  -- Base
  use "wbthomason/packer.nvim"
  use "EdenEast/nightfox.nvim"
  use "tpope/vim-surround"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use 'nvim-treesitter/playground'

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
    -- tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons"
  }
  use {
    "RRethy/vim-illuminate",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-github.nvim" },
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
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
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
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

  -- Git
  use {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true
  }
  use {
    "tpope/vim-fugitive",
    "f-person/git-blame.nvim",
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
  }

  -- Github
  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require "octo".setup(
        {
          suppress_missing_scope = {
            project_v2 = true,
          }
        }
      )
    end
  }
  use "tyru/open-browser.vim"
  use "tyru/open-browser-github.vim"

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvimtools/none-ls.nvim'
  use 'jay-babu/mason-null-ls.nvim'

  -- LSP UI extension
  use {
    "j-hui/fidget.nvim",
    "folke/trouble.nvim",
  }

  use {
    'nvimdev/lspsaga.nvim',
  }

  -- Copilot
  use {
    "github/copilot.vim",
    config = function()
      vim.cmd([[
        let g:copilot_filetypes = {
          \ 'gitcommit': v:true,
          \ 'markdown': v:true,
          \ 'yaml': v:true
          \ }
      ]])
    end
  }

  -- nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
  }

  -- Ruby, slim
  use "slim-template/vim-slim"

  -- Binary
  use "Shougo/vinarise.vim"

  -- Cursor
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  -- Markdown Table
  use "mattn/vim-maketable"

  -- Image Preview
  use {
    "adelarsq/image_preview.nvim",
    config = function() require("image_preview").setup() end
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "brenoprata10/nvim-highlight-colors",
    config = function() require("nvim-highlight-colors").setup {} end
  }

  -- Marksign
  -- use {
  --   "~/ghq/github.com/oky-123/marksign.nvim",
  --   config = function()
  --     require("")
  --   end
  -- }

  use "chrisbra/csv.vim"

  use "prisma/vim-prisma"

  use "jparise/vim-graphql"

  use {
    "yetone/avante.nvim",
    build = "make BUILD_FROM_SOURCE=true",
    lazy = false,
    version = false,
    BUILD_FROM_SOURCE = true,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "HakonHarnes/img-clip.nvim",
    },
  }
end)
