sudo pacman -S --needed git base-devel sudo fakeroot
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S gdm gnome zsh

yay -S go zoom brave-bin slack-desktop visual-studio-code-bin alacritty tmux curl stow gparted gnome-tweaks chrome-gnome-shell otf-hermit guake

yay -S python-dbus jack2 pulseaudio-jack cadence cpupower

yay -S fzf z nvm zsh-syntax-highlighting xclip nano-syntax-highlighting

yay -S vlc transmission-gtk

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
