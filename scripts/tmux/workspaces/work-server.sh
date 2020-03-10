
#!/bin/sh

# session title
session="work"

# session panes
bi=0
app=1
api=2

# Pub key
# prompt="[ssh-passphrase]:"
# key=`read -p $prompt -s pass`

killall "ssh"
eval `ssh-agent`
ssh-add
clear
echo "> Establishing tunnels..."

cd /htdocs

tmux start-server

tmux new-session -d -s $session

# --- Start tunnels --- #

tmux new-window  -t $session:2 -n tunnels
tmux send-keys "./tunnels.sh" ENTER
sleep 5

# --- Make servers enviroment --- #

tmux select-window -t $session:0
tmux splitw -h -p 50
tmux splitw -v -p 50

# --- Run servers commands --- #

tmux rename-window "dev-servers"

# Start Api
tmux send-keys -t $api "cd api" ENTER
tmux send-keys -t $api "npm start" ENTER

# Start App dev server
tmux send-keys -t $app "cd app;make watch" ENTER

# Start lib-bi dev server
tmux send-keys -t $bi "cd lib-bi;npm run watch" ENTER


# --- Start vim --- #
tmux new-window -t $session:1 -n vim
tmux send-keys "cd app && vim" ENTER

# --- Attach --- #
tmux attach-session -t $session

echo "$session"

