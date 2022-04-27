vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('softtabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
vim.cmd 'set expandtab'

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
vim.api.nvim_command 'set noswapfile'
vim.cmd [[highlight link CompeDocumentation NormalFloat]]
vim.cmd [[let g:fugitive_pty = 0]]

vim.g.neovide_transparency = 0.8;


require 'plugins'

