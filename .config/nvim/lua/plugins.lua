return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'tpope/vim-fugitive', opt = true, cmd = {'G'}}

    use 'tpope/vim-commentary'
    use 'justinmk/vim-dirvish'

    use 'mustache/vim-mustache-handlebars'

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
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'arstgmneio', extend_visual = true}
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
            vim.cmd [[colorscheme tokyonight]]
            require('lualine').setup {
                options = {theme = 'tokyonight'},
                extensions = {'fugitive', 'nvim-tree'}
            }
        end
    }

    use {
        'norcalli/nvim_utils',
        config = function()

            require 'nvim_utils'

            local autocmds = {
                Xmonad = {
                    {
                        "BufWritePost", "~/.xmonad**",
                        "!xmonad --recompile && xmonad --restart"
                    }
                },
                TickrReact = {
                    {
                        "BufWinEnter", "/htdocs/tickr-react/**/*", 
                        "set shiftwidth=2 & set tabstop=2 & set softtabstop=2"
                    }
                },
                Format = {
                    {
                        "BufWritePost", "*.ts,*.tsx,*.lua,*.js",
                        "lua vim.lsp.buf.formatting_sync(nil, 1000)"
                    }
                },
                AutoSaveFolds = {
                    {
                        "BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre",
                        "?*", "nested silent! mkview!"
                    }, {"BufWinEnter", "?*?", "silent! loadview"}
                },
                NvimLint = {
                    {
                        "BufWritePost, BufEnter", "*",
                        {"lua require('lint').try_lint()"}
                    }
                }
            }

            nvim_create_augroups(autocmds)
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        branch = '0.5-compat',
        requires = {
            'nvim-treesitter/playground',
            'JoosepAlviste/nvim-ts-context-commentstring',
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
