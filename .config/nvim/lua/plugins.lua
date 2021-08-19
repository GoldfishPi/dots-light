return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {"Pocco81/TrueZen.nvim", opt = true, cmd = {'TZFocus', 'TZAtaraxis'}}
    use {'tpope/vim-fugitive', opt = true, cmd = {'G'}}

    use 'tpope/vim-commentary'
    use 'justinmk/vim-dirvish'

    use 'mustache/vim-mustache-handlebars'

    use "folke/lua-dev.nvim"

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}

        },
        branch = 'async_v2',
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
        'lukas-reineke/format.nvim',
        config = function()
            require"format".setup {
                typescript = {{cmd = {"eslint --fix"}}},
                typescriptreact = {{cmd = {"eslint_d --fix"}}},
                javascript = {{cmd = {"eslint_d --fix"}}},
                rust = {{cmd = {"rustfmt"}}},
                lua = {
                    {
                        cmd = {
                            "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb"
                        }
                    }
                }
            }
        end
    }

    use {
        'hrsh7th/nvim-compe',
        requires = {
            'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets',
            'neovim/nvim-lspconfig'
        },
        config = function()
            require 'setup_compe'
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
                -- Scripts = {{"BufWinEnter", "~/scripts/**", "set ft=sh"}},
                Format = {{"BufWritePost", "*", "FormatWrite"}},
                AutoSaveFolds = {
                    {
                        "BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre",
                        "?*", "nested silent! mkview!"
                    }, {"BufWinEnter", "?*?", "silent! loadview"}
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

end)
