#!/usr/bin/env bash

# Installation on DEBIAN 9 GNOME
# Per prima cosa accertarsi che git sia installato e che le chiavi private siano settate
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
ln -sf ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
DOTFILESDIR=${HOME}/dotfiles

DISTRO=sudo hostnamectl | sudo sed -n "s/^.*Operating System: \(\w\+\) .*$/\1/p"

mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir ~/.config
mkdir ~/opt

rm -rf ~/.tmux

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${DISTRO} $(lsb_release -cs) stable"
sudo apt-get update

echo "******* Installing keyring..."
sudo apt-get install gnome-keyring

echo "******* Installing curl..."
sudo apt-get install -y curl

echo "******* Installing gpg tools..."
sudo apt-get install -y \
    gpgv2 \
    gnupg2 \
    gnupg-agent \
    pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing dev tools..."
sudo apt-get install -y \
    libevent-dev \
    ncurses-dev \
    openssl \
    libcurl4-openssl-dev \
    libxml2 \
    libssl-dev \
    libxml2-dev \
    cmake \
    build-essential \
    pkg-config

echo "******* Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/.local/bin/nvim

echo "******* Installing Lucius colorscheme in neovim..."
git clone git@github.com:componhead/vim-lucius.git ${DOTFILESDIR}
sudo cp ${DOTFILESDIR}/vim-lucius/colors/lucius.vim /usr/share/vim/vim74/colors/

echo "******* Installing tmux..."
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo cp -f ${DOTFILESDIR}/tmux /usr/bin/tmux

 https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

echo "******* Installing Docker..."
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce

echo "******* Installing Facebook PathPicker in ~/.local/bin..."
wget -O ~/.local/bin/fpp.tar.gz https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
cd ~/.local/bin
tar xzvf fpp.tar.gz
rm fpp.tar.gz
cd $HOME

echo "Installing Ripgrep..."
wget -O ~/ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ~/ripgrep.tar.gz -C ~/.local/bin
mv ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg ~/.local/bin
mv ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/complete/rg.fish ~/.config/fish/functions/
rm -rf ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl

echo "******* Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fzf_key_bindings

echo "******* Installing utilities..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    xsel \
    xclip \
    source-highlight \
    unzip \
    colortail \
    colordiff \
    gdebi \
    exfat-fuse \
    exfat-utils

sudo apt-get install sudo apt autoremove -y

echo "******* Linking generics dot configuration files..."
ln -sf ${DOTFILESDIR}/.config/ ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/omf/init.fish $HOME/.config/fish/config.fish
ln -sf ${DOTFILESDIR}/.dockerignore ${HOME}/.dockerignore
ln -sf ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
ln -sf ${DOTFILESDIR}/.ghci ${HOME}/.ghci
ln -sf ${DOTFILESDIR}/ghci.conf ${HOME}/ghci.conf
ln -sf ${DOTFILESDIR}/.git_template ${HOME}/
ln -sf ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
ln -sf ${DOTFILESDIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${DOTFILESDIR}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/ubu/.vimperatorsys ${HOME}/.vimperatorsys
ln -sf ${DOTFILESDIR}/.vimperatorrc ${HOME}/.vimperatorrc
sudo cp -fr ${DOTFILESDIR}/tmux /usr/bin/tmux

git clone componhead@bitbucket.org:componhead/private_dotfiles.git ${DOTFILESDIR}/

echo "*** Setup Fish shell environment..."
echo "******* Installing fish shell..."
sudo echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list 
sudo apt update
sudo apt-get install -y fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
