# Dotfiles
My arch lightdm dotfiles for fun and fast coding 

## Install
1. Clone the dotfiles
```sh
git clone --bare git@github.com:GoldfishPi/dots-light.git $HOME/.cfg && /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```

2. Run the install script which is now in the root directory

```sh
chmod +x ./install.sh  && ./install.sh
```

## How my system works
* gnome shell as a display manager
* kitty for a terminal
* left-wm for window manager
* neovim text editor
* neorg for not taking
