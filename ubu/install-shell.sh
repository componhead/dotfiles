#!/usr/bin/env bash

# args:
# --delete           # delete the dotfiles folder copy files

# Installation on UBUNTU (16.04+)
# Per prima cosa accertarsi che git sia installato e che le chiavi private siano settate
ln -sf ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
DOTFILESDIR=${HOME}/dotfiles

DISTRO=sudo cat /etc/lsb-release | sudo grep "DISTRIB_ID" | sudo sed "s/\w\+=\(\w\+\)$/\1/"

mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir ~/.config
mkdir ~/opt

rm -rf ~/.tmux

sudo add-apt-repository ppa:fish-shell/release-2
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

echo "******* Installing keyring..."
sudo apt-get install gnome-keyring

echo "******* Installing curl..."
sudo apt-get install -y curl

echo "******* Installing neovim Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "******* Installing gpg tools..."
sudo apt-get install -y gpgv2 gnupg2 gnupg-agent pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing dev tools..."
sudo apt-get install -y libevent-dev ncurses-dev openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev cmake build-essential pkg-config

echo "******* Installing Lucius..."
git clone git@github.com:componhead/vim-lucius.git

echo "******* Installing Neovim..."
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo apt-get install neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#sudo update-alternatives --config editor
sudo pip3 install neovim

echo "******* Installing tmux..."
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo cp -f ${DOTFILESDIR}/tmux /usr/bin/tmux

if $DISTRO -eq "Ubuntu";
then
    echo "******* Installing Docker..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-get install -y apt-transport-https docker-ce
    sudo systemctl status docker
    sudo usermod -aG docker $(whoami)
fi


echo "******* Installing Facebook PathPicker in ~/.local/bin..."
wget -O ~/.local/bin/fpp.tar.gz https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
tar xzvf ~/.local/bin/fpp.tar.gz
rm ~/.local/bin/fpp.tar.gz

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
sudo apt-get install -y xsel xclip source-highlight unzip colortail colordiff gdebi exfat-fuse exfat-utils

sudo apt-get install sudo apt autoremove -y

if $1 == "--delete";
then
    echo "******* Copying generics dot configuration files..."
    cp -fr ${DOTFILESDIR}/.config/ ${HOME}/.config/
    ln -sf $HOME/.config/omf/init.fish $HOME/.config/fish/config.fish
    cp -f ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
    cp -f ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
    cp -f ${DOTFILESDIR}/.git_template ${HOME}/
    cp -f ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
    cp -f ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
    cp -f ${DOTFILESDIR}/.tmux.conf ${HOME}/.tmux.conf
    rm -rf ${DOTFILESDIR}
else
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
fi
sudo cp -fr ${DOTFILESDIR}/tmux /usr/bin/tmux

git clone componhead@bitbucket.org:componhead/private_dotfiles.git ${DOTFILESDIR}/

echo "*** Setup Fish shell environment..."
echo "******* Installing fish shell..."
sudo apt-get install -y fish
echo "/usr/bin/fish" | sudo tee -a /etc/shells

chsh -s /usr/bin/fish
