
let g:tasks_open = 0
function! Tasks()
    " let bool = tasks_open == 0
    echo g:tasks_open == 0
    if g:tasks_open ==# 0
        :20sp | :TW;
        let g:tasks_open = 1
    else 
        :q
        let g:tasks_open = 0
    endif
endfunction
