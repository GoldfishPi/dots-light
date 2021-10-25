vim.cmd 'set shiftwidth=2'

require('lint').linters_by_ft = {
  markdown = {'codespell',},
  typescript = {'codespell',},
  typescriptreact = {'codespell',}
}
