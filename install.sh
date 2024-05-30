
sudo pacman -S --needed starship zsh tmux neovim

if [ ! -d "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim" ]; then
        git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
        nvim -c 'PackerInstall'
fi

if [ ! -e "/bin/yay" ]; then
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

yay -S --needed nvim-packer-git ttf-firacode-nerd
