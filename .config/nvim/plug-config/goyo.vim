function! s:goyo_enter()
    call lightline#enable()
    call lightline#disable()
    set background=dark
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
