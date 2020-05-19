#!/bin/bash

# clients=`tmux ls | sed -n -e 's/^[^:]*/p'`
selected=`tmux ls | sed -n -e 's/:.*//p' | dmenu`

alacritty -e tmux attach-session -t $selected
