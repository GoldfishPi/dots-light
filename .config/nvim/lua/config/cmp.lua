vim.o.completeopt = "menuone,noselect"

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --     if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
    --         press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    --     elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --         press("<ESC>:call UltiSnips#JumpForwards()<CR>")
    --     elseif cmp.visible() then
    --         cmp.select_next_item()
    --     elseif has_any_words_before() then
    --         press("<Tab>")
    --     else
    --         fallback()
    --     end
    -- end, {
    --         "i",
    --         "s",
    --     }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --     if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    --         press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
    --     elseif cmp.visible() then
    --         cmp.select_prev_item()
    --     else
    --         fallback()
    --     end
    -- end, {
    --         "i",
    --         "s",
    --     }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'spelling' },
  }
})

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

