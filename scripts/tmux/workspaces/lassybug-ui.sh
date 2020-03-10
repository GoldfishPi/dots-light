# !/bin/bash

session="lassybug-ui"

cd $HOME/projects/lassybug-ui/

tmux start-server
tmux new-session -d -s $session

tmux splitw -h -p 50
tmux send-keys "npm run start" ENTER

tmux select-pane -t 0

tmux send-keys "vim" ENTER
tmux resize-pane -Z

tmux attach-session -t $session

echo $session


