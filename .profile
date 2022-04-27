export EDITOR="nvim"
export TERMINAL="kitty"
# export BROWSER="brave-browser-nightly"
export READER="zathura"

export ZDOTDIR="$HOME/.config/zsh"

export DENO_INSTALL="/home/erik/.deno"

export _JAVA_AWT_WM_NONREPARENTING=1

export ANDROID_HOME=$HOME/Android/Sdk

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:~/.cabal/bin

export PATH=$PATH:~/.scripts

export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$HOME/.ghcup/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"

export NEOVIDE_MULTIGRID=1

setxkbmap -option caps:escape
