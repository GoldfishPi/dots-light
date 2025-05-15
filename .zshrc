
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[cyan]%}[%n@%M %{$fg[magenta]%}%~%{$fg[cyan]%}]%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# History in cahce
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim='nvim'

source $HOME/.config/aliasrc.sh
source $HOME/.config/tokens.sh

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$HOME/.ghcup/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"

export CONFIG=$HOME/.config
export NVIM_CONFIG=$CONFIG/nvime

eval "$(starship init zsh)"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# pnpm
export PNPM_HOME="/home/erik/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=false
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export KUBE_EDITOR=nvim
# source /usr/share/nvm/init-nvm.sh
