require('setup_lsp');
require('setup_compe');
require('setup_treesitter');

require"format".setup {
    typescriptreact = {
        {cmd = {"eslint_d --fix"}}
    }
}
