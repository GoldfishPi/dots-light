let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ ]

let g:startify_bookmarks = [
    \ { 't':'/htdocs/app' },
    \ { 'c':'~/.config/nvim' },
    \ { 'x':'~/.xmonad/' }
  \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0


let g:startify_custom_header = [
            \'    _   _  _____ _____  _   _ ________  ___',
            \'   | \ | ||  ___|  _  || | | |_   _|  \/  |',
            \'   |  \| || |__ | | | || | | | | | | .  . |',
            \'   | . ` ||  __|| | | || | | | | | | |\/| |',
            \'   | |\  || |___\ \_/ /\ \_/ /_| |_| |  | |',
            \'   \_| \_/\____/ \___/  \___/ \___/\_|  |_/',
  \ ]
