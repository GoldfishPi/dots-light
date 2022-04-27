vim.cmd[[colorscheme tokyonight]]
require('lualine').setup {
    options = {theme = 'tokyonight'},
    extensions = {'fugitive', 'nvim-tree'}
}
vim.api.nvim_set_option('laststatus', 3)
