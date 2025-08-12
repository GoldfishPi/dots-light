require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "ts_ls", "eslint", "pylsp", "gopls" }
})
-- local lsp_capabilities = vim.lsp.protocol.make_client_capabilities() --or whatever your setup requires
-- lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
local mapx = require 'mapx';
local nnoremap = mapx.nnoremap;

local lspconfig = require 'lspconfig';

lspconfig.lua_ls.setup {}
lspconfig.svelte.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.terraformls.setup {}

local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local cfn = h.make_builtin({
    name = "cfn-lint",
    meta = {
        url = "https://github.com/aws-cloudformation/cfn-lint",
        description = "Validate AWS CloudFormation yaml/json templates against the AWS CloudFormation Resource Specification",
        notes = {
            "Once a supported file type is opened null-ls will try and determine if the file looks like an AWS Cloudformation template.",
            'A file will be considered an AWS Cloudformation template if it contains a "Resources" or "AWSTemplateFormatVersion" key.',
            'To prevent cfn-lint running on all YAML and JSON files that contain a "Resources" key.',
            'The file must contain at least one AWS Cloudformation Resource Type, e.g "Type": "AWS::S3::Bucket"',
            "This check will run only once when entering the buffer.",
            'This means if "Resources" or "AWSTemplateFormatVersion" is added to a file after this check is run, the cfn-lint diagnostics will not be generated.',
            "To fix this you must restart Neovim.",
        },
    },
    method = DIAGNOSTICS,
    filetypes = { "yaml", "json" },
    generator_opts = {
        command = "cfn-lint",
        args = { "--format", "parseable" },
        to_stdin = true,
        from_stderr = true,
        format = "line",
        check_exit_code = function(code)
            return code <= 1
        end,
        on_output = h.diagnostics.from_pattern(
            [[:(%d+):(%d+):(%d+):(%d+):(([IEW]).*):(.*)]],
            { "row", "col", "end_row", "end_col", "code", "severity", "message" },
            {
                severities = {
                    E = h.diagnostics.severities["error"],
                    W = h.diagnostics.severities["warning"],
                    I = h.diagnostics.severities["information"],
                },
            }
        ),
        runtime_condition = h.cache.by_bufnr(function(params)
            -- check if file looks like a cloudformation template
            local lines = vim.api.nvim_buf_get_lines(params.bufnr, 0, -1, false)

            -- matches the word AWSTemplateFormatVersion optionally surrounded by quotes, zero to many spaces, followed by a colon
            local template_format_version_pattern = '%s*"?AWSTemplateFormatVersion"?%s*:'

            -- matches the word Resources optionally surrounded by quotes, zero to many spaces, followed by a colon
            local resources_pattern = '"?Resources"?%s*:'

            -- This pattern matches the naming convention of an AWS cloudformation resource type "Type": "AWS::ProductIdentifier::ResourceType"
            -- matches the word Type optionally surrounded by quotes, zero to many spaces, followed by a colon,
            -- followed by AWS, 2 colons, 1 or more alphanumeric characters for the product identifier, separated by 2 colons,
            -- followed by one or more alaphanumeric characters for the resource type.
            local resource_type_pattern = '"?Type"?%s*:%s*"?\'?AWS::%w+::%w+"?\'?'

            local found_resources = false
            for _, line in ipairs(lines) do
                if line:match(template_format_version_pattern) then
                    return true
                end

                if line:match(resources_pattern) then
                    found_resources = true
                end

                -- file must contain both Resources as well as Type key which matches the aws resource type naming convention
                if found_resources and line:match(resource_type_pattern) then
                    return true
                end
            end

            return false
        end),
    },
    factory = h.generator_factory,
})

null_ls.setup({
  debug = true,
  sources = {
    cfn
  },
})

lspconfig.gopls.setup{
  on_attach = function (client, bufnr)
    require('go').setup()
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = "*.go",
    --   callback = function()
    --     require('go.format').goimports()
    --   end,
    --   group = format_sync_grp,
    --
    -- })
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ':lua require("go.format").goimports()<CR>', opts)
  end
}
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      configurationSources = { 'flake8' },
      plugins = {
        flake8 = {
          enabled = true,
          ignore = { 'E501', 'E231' },
          maxLineLength = 88,
        },
        black = {enabled = true},
        autopep8 = { enabled = false },
        mccabe = {enabled = false},
        pycodestyle = {
          enabled = false,
          ignore = { 'E501', 'E231' },
          maxLineLength = 88,
        },
        pyflakes = {enabled = false},
      },
    },
  }
}
-- lspconfig.prettier.setup{}

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
