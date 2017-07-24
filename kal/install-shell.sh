#!/usr/bin/env bash

# Installation on KALI ROLLING in docker as root user
DOTFILESDIR=${HOME}/dotfiles

cd ~

if [ ! -d ~/.local ]
then
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share
fi

if [ ! -d ~/.config ]
then
    mkdir ~/.config
fi

echo "******* Installing ssh..."
apt-get install -y ssh

echo "******* Installing git..."
apt-get install -y git-core

echo "******* Installing neovim Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "******* Installing gpg tools..."
apt-get install -y gnupg pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing Neovim..."
apt-get install -y software-properties-common
apt-get install -y python-dev python-pip python3-dev python3-pip
apt-get install -y neovim
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#update-alternatives --config editor

echo "******* Installing unzip..."
apt-get install -y unzip

echo "******* Installing colortail..."
apt-get install -y colortail

echo "******* Installing colordiff..."
apt-get install -y colordiff

echo "******* Installing xsel..."
apt-get install xsel

echo "******* Installing xclip..."
apt-get install xclip

echo "******* Installing Facebook PathPicker in ~/bin..."
wget https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
mkdir -p ~/.local/share/fpp
tar xzvf ~/fpp.tar.gz ~/.local/share/fpp
ls -s ~/.local/share/fpp/fpp ~/.local/bin
rm ~/fpp.tar.gz

echo "******* Installing fish shell..."
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list
wget -nv http://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install -y fish
rm Release.key

echo "******* Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
chmod +x ~/install
/usr/bin/fish ~/install --path=~/.local/share/omf --config=~/.config/omf
rm ~/install

echo "******* Installing omf plugins..."
omf install fzf bang-bang bobthefish

rm -r $HOME/.config/omf
rm -r $HOME/.config/fish

echo "Installing Ripgrep..."
wget -O ~/ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
mkdir -p ~/.local/bin/ripgrep
tar xzvf ~/ripgrep.tar.gz ~/
mv ~/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg ~/.local/bin
mv ~/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/complete/rg.fish ~/.config/fish/functions/
rm -rf ripgrep-0.5.2-x86_64-unknown-linux-musl

apt autoremove -y

echo "******* Cpying generics dot configuration files..."
cp -fr ${DOTFILESDIR}/.config/nvim ${HOME}/.config/nvim
cp -f ${DOTFILESDIR}/.config/nvim/init.vim ${HOME}/.vimrc
cp -f ${DOTFILESDIR}/.config/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
cp -f ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
cp -f ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
cp -f ${DOTFILESDIR}/.git_template ${HOME}/
cp -f ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
cp -f ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
cp -rf ${DOTFILESDIR}/.config/omf $HOME/.config
cp -rf ${DOTFILESDIR}/.config/fish $HOME/.config
ln -sf $HOME/.config/omf/init.fish $HOME/.config/fish/config.fish
rm -rf ${DOTFILESDIR}

chsh -s /usr/bin/fish
