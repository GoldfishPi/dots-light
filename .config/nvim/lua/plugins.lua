return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'tpope/vim-fugitive', opt = true, cmd = {'G'}}

    use 'tpope/vim-commentary'
    use 'justinmk/vim-dirvish'

    use 'editorconfig/editorconfig-vim'

    use {'steelsojka/pears.nvim', config = function ()
        require "pears".setup()
    end}

    use {'b0o/mapx.nvim', requires={
        'phaazon/hop.nvim',
    }, 
    config = function ()
        require 'global_keymaps'
    end}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}

        },
        run = 'make',
        config = function()
            require "setup_telescope"
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'folke/lua-dev.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'quangnguyen30192/cmp-nvim-ultisnips',
            'neovim/nvim-lspconfig',
            'SirVer/ultisnips',
            'mfussenegger/nvim-lint',
        },
        config = function()
            require 'setup_cmp'
            require 'setup_lsp'
        end
    }

    use {
        'folke/tokyonight.nvim',
        requires = {'kyazdani42/nvim-web-devicons', 'hoob3rt/lualine.nvim'},
        config = function()
            require 'theme'
        end
    }

    use {
        'norcalli/nvim_utils',
        config = function()
            require 'auto_cmds'
        end
    }

    use {
        '~/projects/nvim-treesitter',
        run = ':TSUpdate',
        branch = '0.5-compat',
        requires = {
            'nvim-treesitter/playground',
            'JoosepAlviste/nvim-ts-context-commentstring',
            'windwp/nvim-ts-autotag',
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                branch = '0.5-compat'
            }
        },
        config = function()
            require 'setup_treesitter'
        end
    }

    use {
        'windwp/nvim-projectconfig',
        config = function()
            require('nvim-projectconfig').load_project_config()
            require 'project_settings'
        end
    }

end)
