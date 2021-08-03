return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'justinmk/vim-dirvish'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'

    use 'mustache/vim-mustache-handlebars'

    use "Pocco81/TrueZen.nvim"

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        run = 'make',
        config = function()
            local actions = require('telescope.actions');
            require('telescope').setup {
                defaults = {
                    file_sorter = require('telescope.sorters').get_fzy_sorter,
                    file_ignore_patterns = {
                        "%.png", "*.jpg", "node_modules/*", ".dist/*",
                        ".build/*"
                    },
                    mappings = {i = {["<c-CR>"] = actions.git_create_branch}}
                },
                extensions = {
                    fzf = {
                        override_generic_sorter = false, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case"
                    }
                }
            }
            require('telescope').load_extension('fzf')
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
        requires = {
            {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
            'kyazdani42/nvim-web-devicons', 'hoob3rt/lualine.nvim'
        },
        config = function()
            vim.cmd [[colorscheme tokyonight]]
            require('lualine').setup {
                options = {theme = 'tokyonight'},
                extensions = {'fugitive', 'nvim-tree'}
            }
            require 'setup_treesitter'
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

end)
