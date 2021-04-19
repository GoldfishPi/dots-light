
vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq

paq{'savq/paq-nvim', opt=true}

paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

paq 'justinmk/vim-dirvish'

paq 'mhinz/vim-startify'

paq 'steelsojka/pears.nvim'
paq 'tpope/vim-commentary'

paq 'junegunn/goyo.vim'

paq 'janko/vim-test'

paq 'neovim/nvim-lspconfig'

paq {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
paq 'alvan/vim-closetag'
paq 'lukas-reineke/format.nvim'

paq 'hrsh7th/nvim-compe'

paq 'mhinz/vim-signify'
paq 'tpope/vim-fugitive'

paq 'joshdick/onedark.vim'
paq 'itchyny/lightline.vim'

paq 'norcalli/nvim_utils'

paq {'styled-components/vim-styled-components', branch='main' }
paq 'mustache/vim-mustache-handlebars'
paq 'maxmellon/vim-jsx-pretty'

vim.api.nvim_command'set tabstop=4'
vim.api.nvim_command'set softtabstop=4'
vim.api.nvim_command'set shiftwidth=4'
vim.api.nvim_command'set expandtab'

vim.api.nvim_command'set number'
vim.api.nvim_command'set showcmd'

vim.api.nvim_command'syntax on '
vim.api.nvim_command'colorscheme onedark'
vim.api.nvim_command'set t_Co=256'
vim.api.nvim_command'set termguicolors'
vim.api.nvim_command'set noswapfile'

vim.api.nvim_command'set splitbelow'
vim.api.nvim_command'set splitright'

vim.api.nvim_command'hi Normal ctermbg=NONE guibg=NONE'

vim.api.nvim_command'set viewoptions=folds,cursor'
vim.api.nvim_command'set sessionoptions=folds'

vim.api.nvim_command'set foldmethod=manual'
vim.api.nvim_command'set wildignore+=*/node_modules/*,*/build/*,*/.build/*,*/dist/*,*/.dist/*,*/plugged/*'
vim.api.nvim_command'set relativenumber'
vim.api.nvim_command'set rnu'
vim.api.nvim_command'set updatetime=400'

vim.api.nvim_command"let mapleader = ' '"
vim.api.nvim_command"let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'"
vim.api.nvim_command"let g:lightline = { 'colorscheme': 'onedark' }"


vim.api.nvim_set_keymap('n', '<leader>L', ':luafile %<CR>', {  noremap = true });

require'nvim_utils'

local autocmds = {
    Xmonad = {
        { "BufWritePost", "~/.xmonad**", "!xmonad --recompile && xmonad --restart"}
    },
    Scripts = {
        { "BufWinEnter", "~/scripts/**", "set ft=sh" }
    },
    Format = {
        { "BufWritePost", "*", "FormatWrite"}
    },
    AutoSaveFolds = {
        { "BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre", "?*", "nested silent! mkview!" },
        { "BufWinEnter", "?*?", "silent! loadview" }
    }
}

nvim_create_augroups(autocmds)

require"format".setup {
    typescript = {
        {cmd = {"eslint_d --fix"}}
    },
    typescriptreact = {
        {cmd = {"eslint_d --fix"}}
    },
    rust = {
        {cmd = {"rustfmt"}}
    }
}

require "pears".setup()

require'setup_compe'
require'setup_lsp'
require'setup_treesitter'

vim.api.nvim_command'source $HOME/.config/nvim/keymaps.vim'
vim.api.nvim_command'source $HOME/.config/nvim/start-screen.vim'
