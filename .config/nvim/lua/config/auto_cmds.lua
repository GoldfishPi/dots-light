vim.api.nvim_create_autocmd({ "BufWinLeave","BufLeave","BufWritePost","BufHidden","QuitPre"}, {
  pattern = {"?*"},
  command = "silent! mkview!"
});

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"?*?"},
  command = "silent! loadview"
});
