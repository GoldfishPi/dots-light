vim.api.nvim_command "let g:startify_session_dir = '~/.config/nvim/session'"

vim.api.nvim_set_var('startify_lists', {
    {type = "sessions", header = {'Sessions'}},
    {type = "files", header = {'Files'}},
    {type = 'dir', header = {"Current Directory"}},
    {type = 'bookmarks', header = {'Bookmarks'}}
})
vim.api.nvim_set_var('startify_bookmarks', {
    {t = '/htdocs/app', c = '~/.config/nvim', x = '~/.xmonad'}
})
vim.api.nvim_set_var('startify_session_autoload', 1)

vim.api.nvim_set_var('startify_session_delete_buffer', 1)
vim.api.nvim_set_var('startify_change_to_vcs_roo', 1)
vim.api.nvim_set_var('startify_fortune_use_unicod', 1)
vim.api.nvim_set_var('startify_session_persistenc', 1)
vim.api.nvim_set_var('startify_enable_specia', 0)

vim.api.nvim_set_var('startify_custom_header', {
    [[ _   _  _____ _____  _   _ ________  ___]],
    [[| \ | ||  ___|  _  || | | |_   _|  \/  |]],
    [[|  \| || |__ | | | || | | | | | | .  . |]],
    [[| . ` ||  __|| | | || | | | | | | |\/| |]],
    [[| |\  || |___\ \_/ /\ \_/ /_| |_| |  | |]],
    [[\_| \_/\____/ \___/  \___/ \___/\_|  |_/]]
})

