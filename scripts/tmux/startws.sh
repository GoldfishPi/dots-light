#!/bin/bash
script=`ls $HOME/scripts/tmux/workspaces/ | grep -v "startws" | grep -v "killws" | dmenu`
if [ $script ]; then
    # termite -e 'echo wowers; bash'
    termite -e "bash $HOME/scripts/tmux/workspaces/$script" --hold&
fi
