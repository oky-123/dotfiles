-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- plugins
local plugins = {
  -- Base
  "wbthomason/packer.nvim",
  "EdenEast/nightfox.nvim",
  "tpope/vim-surround",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  'nvim-treesitter/playground',

  -- Status/Bufferline
  {
    "SmiteshP/nvim-gps",
    dependencies = "nvim-treesitter/nvim-treesitter"
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-gps" }
  },
  {
    "akinsho/bufferline.nvim",
    -- tag = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
    "RRethy/vim-illuminate",
    dependencies = "nvim-treesitter/nvim-treesitter"
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-github.nvim" },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = "kkharji/sqlite.lua"
  },

  -- Filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Indent guide
  {
    "lukas-reineke/indent-blankline.nvim"
  },

  -- Scrollbar
  "petertriho/nvim-scrollbar",
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup {}
    end,
  },

  -- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true
  },
  {
    "tpope/vim-fugitive",
    "f-person/git-blame.nvim",
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
  },

  -- Github
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
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
  },
  "tyru/open-browser.vim",
  {
    "tyru/open-browser-github.vim",
    dependencies = "tyru/open-browser.vim"
  },

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'nvimtools/none-ls.nvim',
  'jay-babu/mason-null-ls.nvim',

  -- LSP UI extension
  {
    "j-hui/fidget.nvim",
    "folke/trouble.nvim",
  },

  {
    'nvimdev/lspsaga.nvim',
  },

  -- Copilot
  {
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
  },

  -- nvim-cmp
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

  -- Ruby, slim
  "slim-template/vim-slim",

  -- Binary
  "Shougo/vinarise.vim",

  -- Cursor
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require 'hop'.setup {}
    end
  },

  -- Markdown Table
  "mattn/vim-maketable",

  -- Image Preview
  {
    "adelarsq/image_preview.nvim",
    config = function() require("image_preview").setup() end
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    "brenoprata10/nvim-highlight-colors",
    config = function() require("nvim-highlight-colors").setup {} end
  },

  -- Marksign
  -- {
  --   "~/ghq/github.com/oky-123/marksign.nvim",
  --   config = function()
  --     require("")
  --   end
  -- }

  "chrisbra/csv.vim",

  "prisma/vim-prisma",

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

-- Setup lazy.nvim
require("lazy").setup(plugins, {
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
