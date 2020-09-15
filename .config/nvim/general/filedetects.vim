
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

au BufNewFile,BufRead *.prisma setfiletype graphql

autocmd bufwritepost *.[tj]s[x] silent :CocCommand eslint.executeAutofix
autocmd bufwritepost *.[tj]s silent :CocCommand eslint.executeAutofix

autocmd BufNewFile,BufRead $HOME/projects/tickr*
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    
