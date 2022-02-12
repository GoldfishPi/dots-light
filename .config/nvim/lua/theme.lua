vim.cmd[[colorscheme tokyonight]]
require('lualine').setup {
    options = {theme = 'tokyonight'},
    extensions = {'fugitive', 'nvim-tree'}
}
