require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "ts_ls", "eslint", "pylsp", "gopls" }
})
local mapx = require 'mapx';
local nnoremap = mapx.nnoremap;

local lspconfig = require 'lspconfig';

lspconfig.lua_ls.setup {}

lspconfig.gopls.setup{
  on_attach = function (client, bufnr)
    require('go').setup()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,

    })
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ':lua require("go.format").goimports()<CR>', opts)
  end
}
lspconfig.pylsp.setup{}

lspconfig.eslint.setup {
  on_attach = function ()
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.tsx,*.ts,*.jsx,*.js" },
      callback = function()
        vim.cmd [[EslintFixAll]]
        vim.lsp.buf.format()
      end
    })
  end
}

lspconfig.ts_ls.setup {
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      import_all_timeout = 5000, -- ms

      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      always_organize_imports = true,

      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200, -- priority of the hint extmarks
      inlay_hints_throttle = 150, -- throttle the inlay hint request
      inlay_hints_format = { -- format options for individual hint kind
        Type = {},
        Parameter = {},
        Enum = {},
      },

      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    })

    ts_utils.setup_client(client)

    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cR", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSLspImportAll<CR>", opts)
  end
}

