
aug xmonad
    au!
    au BufWritePost ~/.xmonad/** !xmonad --recompile && xmonad --restart
aug END

aug scripts
    au!
    au BufWritePost ~/scripts/** set ft=sh
aug END

" autocmd BufWritePre *.tsx,*.ts Neoformat eslint_d
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " BufHidden for for compatibility with `set hidden`
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end
