vim.opt.updatetime = 100

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

require'nvim-treesitter.configs'.setup {
  sync_install = true,
  ensure_installed = {
    "html",
    "javascript",
    "typescript",
    "python",
    "go",
  },
  highlight = {
    enable = true,
    disable = {"c"}
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
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
}

require("nvim-ts-autotag").setup({
  opts = {

    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
})
