#!/bin/bash

# clients=`tmux ls | sed -n -e 's/^[^:]*/p'`
selected=`tmux ls | sed -n -e 's/:.*//p' | dmenu`

termite -e "tmux attach-session -t $selected"
