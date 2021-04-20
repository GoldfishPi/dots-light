vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq

paq {'savq/paq-nvim', opt = true}

paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

paq 'justinmk/vim-dirvish'

paq 'mhinz/vim-startify'
paq 'glepnir/dashboard-nvim'

paq 'steelsojka/pears.nvim'
paq 'tpope/vim-commentary'

paq 'janko/vim-test'

paq 'neovim/nvim-lspconfig'

paq {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
paq 'alvan/vim-closetag'
paq 'lukas-reineke/format.nvim'

paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'rafamadriz/friendly-snippets'

paq 'mhinz/vim-signify'
paq 'tpope/vim-fugitive'

paq 'hoob3rt/lualine.nvim'
paq 'kyazdani42/nvim-web-devicons'

paq 'folke/tokyonight.nvim'

paq 'norcalli/nvim_utils'

paq {'styled-components/vim-styled-components', branch = 'main'}
paq 'mustache/vim-mustache-handlebars'
paq 'maxmellon/vim-jsx-pretty'

require 'nvim_utils'

vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('expandtab', true)

vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('showcmd', true)

vim.api.nvim_set_option('termguicolors', true)

vim.api.nvim_set_option('splitbelow', true)
vim.api.nvim_set_option('splitright', true)

vim.api.nvim_set_option('viewoptions', 'folds,cursor')
vim.api.nvim_set_option('sessionoptions', 'folds')

vim.api.nvim_set_option('foldmethod', 'manual')
vim.api.nvim_set_option('wildignore',
                        vim.api.nvim_get_option('wildignore') .. [[
                            */node_modules/*,
                            */build/*,
                            */.build/*,
                            */dist/*,
                            */.dist/*,
                            */plugged/*
                            ]])

vim.api.nvim_set_option('updatetime', 400)
vim.api.nvim_set_option('colorcolumn', '80')

vim.api.nvim_set_var('closetag_filenames', '*.html,*.hbs,*.js,*.jsx,*.tsx')
vim.api.nvim_set_var('mapleader', ' ')

vim.api.nvim_set_keymap('n', '<leader>L', ':luafile %<CR>', {noremap = true});

vim.api.nvim_command 'set relativenumber'
vim.api.nvim_command 'set nu rnu'
vim.api.nvim_command 'syntax on'
vim.cmd [[colorscheme tokyonight]]
vim.api.nvim_command 'set noswapfile'
vim.cmd [[highlight link CompeDocumentation NormalFloat]]

local autocmds = {
    Xmonad = {
        {
            "BufWritePost", "~/.xmonad**",
            "!xmonad --recompile && xmonad --restart"
        }
    },
    Scripts = {{"BufWinEnter", "~/scripts/**", "set ft=sh"}},
    Format = {{"BufWritePost", "*", "FormatWrite"}},
    AutoSaveFolds = {
        {
            "BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre", "?*",
            "nested silent! mkview!"
        }, {"BufWinEnter", "?*?", "silent! loadview"}
    }
}

nvim_create_augroups(autocmds)

require"format".setup {
    typescript = {{cmd = {"eslint_d --fix"}}},
    typescriptreact = {{cmd = {"eslint_d --fix"}}},
    rust = {{cmd = {"rustfmt"}}},
    lua = {
        {
            cmd = {
                "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb"
            }
        }
    }
}

-- require"pears".setup()
require('lualine').setup {
    options = {theme = 'tokyonight'},
    extensions = {'fugitive'}
}

require 'start_screen'
require 'setup_compe'
require 'setup_lsp'
require 'setup_treesitter'

vim.api.nvim_command 'source $HOME/.config/nvim/keymaps.vim'

