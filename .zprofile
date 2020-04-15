
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="brave"
export READER="zathura"

export ZDOTDIR="$HOME/.config/zsh"

[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
