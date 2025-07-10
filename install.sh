
sudo pacman -S --needed --noconfirm starship zsh tmux neovim docker exa bat fastfetch sway swaybg fuzzel nemo kitty nodejs npm mako git base-devel

# if [ ! "$SHELL" == "/bin/zsh" ]; then
#         chsh -s /bin/zsh
# fi

if [ ! -e "/bin/yay" ]; then
        git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

sudo usermod -aG docker $USER
sudo systemctl start docker.service
sudo systemctl enable docker.service

yay -S --needed --noconfirm nvim-packer-git ttf-firacode-nerd
git config --global core.editor "nvim"

if [ ! -d "./.config" ]; then
  mkdir .config
fi

touch ./.config/tokens.sh
