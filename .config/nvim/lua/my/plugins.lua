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

      -- Git
      use {
          "TimUntersberger/neogit",
          "sindrets/diffview.nvim",
          "tpope/vim-fugitive",
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
            require "octo".setup()
          end
      }
      use "tyru/open-browser.vim"
      use "tyru/open-browser-github.vim"

      -- LSP
      use 'neovim/nvim-lspconfig'
      use 'williamboman/mason.nvim'
      use 'williamboman/mason-lspconfig.nvim'
      use 'jose-elias-alvarez/null-ls.nvim'

      -- LSP UI extension
      use {
          "j-hui/fidget.nvim",
          "folke/trouble.nvim",
          "kkharji/lspsaga.nvim",
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
      use "ggandor/lightspeed.nvim"
    end)
