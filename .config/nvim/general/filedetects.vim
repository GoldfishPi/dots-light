
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

au BufNewFile,BufRead *.prisma setfiletype graphql

au BufNewFile,BufRead *.md
    \ set spell |
    \ set spelllang=en_us
