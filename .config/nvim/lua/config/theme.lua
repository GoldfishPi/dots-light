require("everforest").setup({})
vim.cmd[[colorscheme everforest]]
require('lualine').setup {
    options = {theme = 'everforest'},
    extensions = {'fugitive', 'nvim-tree'}
}
vim.api.nvim_set_option('laststatus', 3)
