
sudo pacman -S --needed starship zsh tmux neovim docker exa bat fastfetch sway swaybg fuzzel nemo kitty nodejs

if [ ! "$SHELL" == "/bin/zsh" ]; then
        chsh -s /bin/zsh
fi

if [ ! -e "/bin/yay" ]; then
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

sudo usermod -aG docker $USER
sudo systemctl start docker.service
sudo systemctl enable docker.service

yay -S --needed nvim-packer-git ttf-firacode-nerd
git config --global core.editor "nvim"

touch ./.config/tokens.sh
