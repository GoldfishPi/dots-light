vim.opt.updatetime = 100

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"c"} -- list of language that will be disabled
    },
--     indent = {enable = true},
     autotag = {enable = true},
     textobjects = {
         select = {
             enable = true,
 
             -- Automatically jump forward to textobj, similar to targets.vim 
             lookahead = true,
 
             keymaps = {
                 -- You can use the capture groups defined in textobjects.scm
                 ["af"] = "@function.outer",
                 ["if"] = "@function.inner",
                 ["ac"] = "@call.outer",
                 ["ic"] = "@call.inner",
                 ["ap"] = "@parameter.outer",
                 ["ip"] = "@parameter.inner",
                 ["av"] = "@myTextObject",
                 ["am"] = "@jsx_self_closing_element.outer"
             }
         }
     },
--     playground = {
--         enable = true,
--         disable = {},
--         updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--         persist_queries = false, -- Whether the query persists across vim sessions
--         keybindings = {
--             toggle_query_editor = 'o',
--             toggle_hl_groups = 'i',
--             toggle_injected_languages = 't',
--             toggle_anonymous_nodes = 'a',
--             toggle_language_display = 'I',
--             focus_language = 'f',
--             unfocus_language = 'F',
--             update = 'R',
--             goto_node = '<cr>',
--             show_help = '?'
--         }
--    }
}
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--         underline = true,
--         virtual_text = {
--             spacing = 5,
--         },
--         update_in_insert = true,
--     }
-- )
--
-- require('nvim-treesitter.configs').setup {
--   ensure_installed = { 'vim', 'lua' },
--   highlight = {
--     enable = true,
--   },
-- }


