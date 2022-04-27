return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'tpope/vim-fugitive', opt = true, cmd = {'G'}}

    use 'tpope/vim-commentary'
    use 'justinmk/vim-dirvish'

    use 'editorconfig/editorconfig-vim'

    use {'windwp/nvim-autopairs', config = function ()
      require('nvim-autopairs').setup{}
    end}

    use {'b0o/mapx.nvim', requires={
        'phaazon/hop.nvim',
    }, config = function ()
        require 'config/keymaps'
    end}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}

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
            'folke/lua-dev.nvim',
            -- 'quangnguyen30192/cmp-nvim-ultisnips',
            'neovim/nvim-lspconfig',
            -- 'SirVer/ultisnips',
            -- 'williamboman/nvim-lsp-installer',
            'jose-elias-alvarez/nvim-lsp-ts-utils',
        },
        config = function()
            require 'config/lsp'
            require 'config/cmp'
        end
    }

    use {
      'mfussenegger/nvim-lint',
      config = function ()
        require 'config/nvim_lint'
      end
    }

    use {
        'folke/tokyonight.nvim',
        requires = {'kyazdani42/nvim-web-devicons', 'hoob3rt/lualine.nvim'},
        config = function()
            require 'config/theme'
        end
    }

    -- use {
    --     'norcalli/nvim_utils',
    --     config = function()
    --         require 'config/auto_cmds'
    --     end
    -- }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'windwp/nvim-ts-autotag',
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                branch = '0.5-compat'
            }
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
          require("project_nvim").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
    }

end)
