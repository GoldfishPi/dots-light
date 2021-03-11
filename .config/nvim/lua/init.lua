require('setup_lsp');
require('setup_compe');
require('setup_treesitter');

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
