vim.api.nvim_create_autocmd({ "BufWinLeave", "BufLeave", "BufWritePost", "BufHidden", "QuitPre" }, {
  pattern = { "?*" },
  command = "silent! mkview!"
});

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "?*?" },
  command = "silent! loadview"
});

vim.api.nvim_create_autocmd({ "BufWritePre"}, {
  pattern = {"*"},
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 2000)
  end
})
