#!/usr/bin/env bash

# Installation on DEBIAN 9 GNOME
# Per prima cosa accertarsi che git sia installato e che le chiavi private siano settate
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
cp ../.ssh/config ${HOME}/.ssh/config

DISTRO=sudo hostnamectl | sudo sed -n "s/^.*Operating System: \(\w\+\) .*$/\1/p"

mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir ~/.config

rm -rf ~/.tmux

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${DISTRO} $(lsb_release -cs) stable"
sudo apt-get update

echo "******* Installing keyring..."
sudo apt-get install gnome-keyring

echo "******* Installing curl..."
sudo apt-get install -y curl

echo "******* Installing python3..."
sudo apt install python3-dev python3-pip python3-setuptools

echo "******* Installing thefuck..."
sudo pip install thefuck

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
    pkg-config \
    gnome-tweak-tool \
    dconf-editor \
    neovim

echo "******* Installing Lucius colorscheme in neovim..."
git clone git@github.com:componhead/vim-lucius.git ../
sudo cp ../vim-lucius/colors/lucius.vim /usr/share/vim/vim74/colors/

echo "******* Installing tmux..."
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
sudo snap install ripgrep --classic

echo "******* Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -y
fzf_key_bindings

echo "******* Installing npm..."
sudo apt remove --purge -y nodejs npm
sudo apt clean
sudo apt autoclean
sudo apt install -f
sudo apt autoremove -y
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y nodejs-dev node-gyp libssl1.0-dev
sudo apt install -y npm
sudo apt install -y yarn
sudo npm cache clean -f
sudo npm install -g n
sudo n stable


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
    exfat-utils \
    autokey-gtk \
    nodejs

echo "******* Installing gitmoji..."
npm i -g gitmoji-cli

sudo sh -c "curl https://raw.githubusercontent.com/mrowa44/emojifgy/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"

sudo apt-get install sudo apt autoremove -y

echo "******* Linking generics dot configuration files..."
ln -sf $DOTFILES/.config/fish ~/.config/
ln -sf $DOTFILES/.config/nvim ~/.config/
ln -sf $DOTFILES/.config/omf ~/.config/
ln -sf $DOTFILES/.config/exercism ~/.config/
ln -sf ${HOME}/.config/omf/init.fish ${HOME}/.config/fish/config.fish
ln -sf $DOTFILES/.dockerignore ${HOME}/.dockerignore
ln -sf $DOTFILES/.gitconfig ${HOME}/.gitconfig
ln -sf $DOTFILES/.gitignore_global ${HOME}/.gitignore_global
ln -sf $DOTFILES/.ghci ${HOME}/.ghci
ln -sf $DOTFILES/ghci.conf ${HOME}/ghci.conf
ln -sf $DOTFILES/.git_template ${HOME}/.git_template
ln -sf $DOTFILES/.scalafmt ${HOME}/.scalafmt
ln -sf $DOTFILES/.vimsessions ${HOME}/.vimsessions
ln -sf $DOTFILES/.tmux.conf ${HOME}/.tmux.conf

git clone componhead@bitbucket.org:componhead/private_dotfiles.git ../

echo "*** Setup Fish shell environment..."
echo "******* Installing fish shell..."
sudo echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list 
sudo apt update
sudo apt-get install -y fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
