# !/bin/bash

selected=`tmux ls | sed -n -e 's/:.*//p' | dmenu`

tmux kill-session -t $selected
