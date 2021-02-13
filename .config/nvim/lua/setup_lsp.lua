local lspconfig = require'lspconfig';
local lsp = require'lspconfig';
local configs = require'lspconfig/configs';



lspconfig.rls.setup{}
lspconfig.tsserver.setup{}


require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { "c" },  -- list of language that will be disabled
    },
    indent = {
        enable = true
    }
}

lsp.diagnosticls.setup({
    on_attach = on_attach,
    filetypes={
        'markdown',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'css',
        'scss',
        'sass'
    },
    init_options = {
        linters = {
            eslint = {
                command = 'eslint',
                rootPatterns = { '.git' },
                debounce = 100,
                args = {
                    '--stdin',
                    '--stdin-filename',
                    '%filepath',
                    '--format',
                    'json'
                },
                sourceName = 'eslint',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {
                    [2] = 'error',
                    [1] = 'warning',
                },
            },
            stylelint = {
                command = './node_modules/.bin/stylelint',
                rootPatterns = { '.git' },
                debounce = 100,
                args = {
                    '--formatter',
                    'json',
                    '--stdin-filename',
                    '%filepath'
                },
                sourceName = 'stylelint',
                parseJson = {
                    errorsRoot = '[0].warnings',
                    line = 'line',
                    column = 'column',
                    message = '${text}',
                    security = 'severity'
                },
                securities = {
                    error = 'error',
                    warning = 'warning'
                }
            },
            markdownlint = {
                command = 'markdownlint',
                isStderr = true,
                debounce = 100,
                args = { '--stdin' },
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = 'markdownlint',
                formatLines = 1,
                formatPattern = {
                    '^.*?:\\s+(\\d+):\\s+(.*)(\\r|\\n)*$',
                    {
                        line = 1,
                        column = -1,
                        message = 2
                    }
                }
            }
        },
        filetypes = {
            markdown = 'markdownlint',
            javascript = 'eslint',
            typescript = 'eslint',
            javascriptreact = 'eslint',
            typescriptreact = 'eslint',
            css = 'stylelint',
            scss = 'stylelint',
            sass = 'stylelint'
        },
        formatters = {
            eslint = {
                command = './node_modules/.bin/eslint',
                args = {
                    '--fix'
                }
            },
            prettier = {
                command = './node_modules/.bin/prettier',
                args = {
                    '--stdin-filepath',
                    '%filepath',
                    '--single-quote',
                    '--print-width 120'
                }
            }
        },
        formatFiletypes = {
            javascript = 'prettier',
            typescript = 'prettier',
            javascriptreact = 'prettier',
            typescriptreact = 'prettier'
        },
    }
});
