function! s:goyo_enter()
    call lightline#enable()
    call lightline#disable()
    set background=dark
    Limelight
endfunction

function! s:goyo_leave()
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
