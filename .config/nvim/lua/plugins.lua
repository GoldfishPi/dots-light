return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'tpope/vim-fugitive', opt = true, cmd = { 'G' } }

  use 'tpope/vim-commentary'
  use 'justinmk/vim-dirvish'

  use 'editorconfig/editorconfig-vim'
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use { 'windhp/nvim-autopairs', config = function()
    require('nvim-autopairs').setup {}
  end }

  use { 'b0o/mapx.nvim', requires = {
    'phaazon/hop.nvim',
  }, config = function()
      require 'config/keymaps'
    end }

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
      'jose-elias-alvarez/null-ls.nvim',
      'jose-elias-alvarez/nvim-lsp-ts-utils',
    },
    config = function()
      require 'config/lsp'
      require 'config/cmp'
    end
  }

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    requires = {'nvim-neorg/neorg-telescope'},
    config = function()
      require 'config/neorg'
    end,
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  -- use {
  --   'mfussenegger/nvim-lint',
  --   config = function()
  --     require 'config/nvim_lint'
  --   end
  -- }

  use {
    'folke/tokyonight.nvim',
    requires = { 'kyazdani42/nvim-heb-devicons', 'hoob3rt/lualine.nvim' },
    config = function()
      require 'config/theme'
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects'
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
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  }

end)
