return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'tpope/vim-fugitive', opt = true, cmd = { 'G' } }

  -- use 'tpope/vim-commentary'
  use {'stevearc/oil.nvim', config = function()
    require('oil').setup {
      default_file_explorer = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    }
  end}

  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'dstein64/vim-startuptime'

  use { 'windwp/nvim-autopairs', config = function()
    require('nvim-autopairs').setup {}
  end }

  use { 'b0o/mapx.nvim', requires = {
    'phaazon/hop.nvim',
  }, config = function()
      require 'config/keymaps'
    end }

  use {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }

    },
    run = 'make',
    config = function()
      require("config/telescope").setup()
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'folke/lua-dev.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      'nvimtools/none-ls.nvim',
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'ray-x/go.nvim'

      -- 'zbirenbaum/copilot.lua',
      -- 'zbirenbaum/copilot-cmp',
    },
    config = function()
      require 'config/lsp'
      require 'config/cmp'
    end
  }

  use {'nvim-orgmode/orgmode',
  requires = {'joaomsa/telescope-orgmode.nvim'},
  config = function()
          require 'config/org'
  end
  }

  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  }

  use {
    'mfussenegger/nvim-lint',
    config = function()
      require 'config/nvim_lint'
    end
  }

  use {
    'neanias/everforest-nvim',
    requires = { 'kyazdani42/nvim-web-devicons', 'hoob3rt/lualine.nvim' },
    config = function()
      require 'config/theme'
    end
  }


  use {
    'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'numToStr/Comment.nvim',
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    config = function()
      require 'config/treesitter'
    end
  }

  use {
    'windwp/nvim-projectconfig',
    config = function()
      require('nvim-projectconfig').load_project_config()
      require 'config/project_settings'
    end
  }
  -- use {
  --   "ahmedkhalf/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {}
  --   end
  -- }
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }
  use {"lambdalisue/vim-suda"}
  use {
    "Zeioth/makeit.nvim",
    requires={"stevearc/overseer.nvim"},
    config = function()
      require('overseer').setup({
              task_list = {
                      direction = "bottom",
                      min_height = 15,
                      max_height = 15,
                      default_detail = 1
              },
      })
      require("makeit").setup {}
    end
  }
  use {
    'mhartington/formatter.nvim',
    config = function ()
      require "config.formatter"
    end
  }

end)
