export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="zathura"

export ZDOTDIR="$HOME/.config/zsh"

export DENO_INSTALL="/home/erik/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

export _JAVA_AWT_WM_NONREPARENTING=1

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:~/.cabal/bin

export PATH=$PATH:~/.scripts

setxkbmap -option caps:escape
