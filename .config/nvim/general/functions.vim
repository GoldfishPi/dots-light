
function! OpenTasks(prjct)
    let buff_exists = bufwinnr("task next report")

    "Kill buffer if it exists
    if buff_exists != -1

        :bdelete task\ next\ report 

    "Oepn new TW window if it window isnt open
    else

        if a:prjct != ""
            execute ":bot 20 split | :TW project:". a:prjct
        else
            execute ":bot 20 split | :TW"
        endif

    endif

endfunction
