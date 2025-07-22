
require('formatter').setup {
  loggin = true,
  log_level = vim.log.levels.TRACE,
  filetype = {
    typescriptreact = {
      -- require('formatter.filetypes.typescriptreact').prettier
      require('formatter.defaults.prettier')
    },
    svelte = {
      require('formatter.defaults.prettier')
    },
    python = {
      require('formatter.filetypes.python').autopep8,
      require('formatter.filetypes.python').black
    },
    go = {
      require('formatter.filetypes.go').gofmt,
    },
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
      -- Remove trailing whitespace without 'sed'
      -- require("formatter.filetypes.any").substitute_trailing_whitespace,
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  callback = function (args)
    local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

    if vim.tbl_contains({"acwrite"}, buftype) then
      return
    end

    vim.cmd [[:FormatWrite]]
  end,
  group = "__formatter__",
})
