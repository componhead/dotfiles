#!/usr/bin/env bash

# args:
# --delete           # delete the dotfiles folder copy files

# Installation on UBUNTU (16.04+)
DOTFILESDIR=${HOME}/dotfiles

DISTRO=sudo cat /etc/lsb-release | sudo grep "DISTRIB_ID" | sudo sed "s/\w\+=\(\w\+\)$/\1/"

if [ ! -d ~/.local/bin ]
then
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share
fi

if [ ! -d ~/.config ]
then
    mkdir ~/.config
fi

rm -rf ~/.tmux

echo "******* Installing curl..."
sudo apt-get install -y curl

echo "******* Installing neovim Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "******* Installing gpg tools..."
sudo apt-get install -y gpgv2 gnupg2 gnupg-agent pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing Neovim..."
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
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

echo "******* Installing unzip..."
sudo apt-get install -y unzip

echo "******* Installing colortail..."
sudo apt-get install -y colortail

echo "******* Installing colordiff..."
sudo apt-get install -y colordiff

if $DISTRO -eq "Ubuntu";
then
    echo "******* Installing Docker..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y apt-transport-https docker-ce
    sudo systemctl status docker
    sudo usermod -aG docker $(whoami)
fi

echo "******* Installing xsel..."
sudo apt-get install xsel

echo "******* Installing xclip..."
sudo apt-get install xclip

echo "******* Installing Facebook PathPicker in ~/.local/bin..."
wget -O ~/fpp.tar.gz https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
tar --warning=no-unknown-keyword -zxf ~/fpp.tar.gz
mv ~/fpp ~/.local/bin
mv ~/._fpp ~/.local/bin
mv ~/src ~/.local/bin
rm ~/fpp.tar.gz

echo "Installing Ripgrep..."
wget -O ~/ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ~/ripgrep.tar.gz -C ~/.local/bin
mv ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg ~/.local/bin
mv ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/complete/rg.fish ~/.config/fish/functions/
rm -rf ~/.local/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl

echo "******* Installing source-highlight..."
sudo apt-get install -y source-highlight

echo "******* Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "******* Installing dev tools..."
sudo apt-get install libevent-dev ncurses-dev

sudo apt autoremove -y

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
    ln -sf ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
    ln -sf ${DOTFILESDIR}/.tmux.conf ${HOME}/.tmux.conf
    ln -sf ${DOTFILESDIR}/ubu/.vimperatorsys ${HOME}/.vimperatorsys
    ln -sf ${DOTFILESDIR}/.vimperatorrc ${HOME}/.vimperatorrc
fi

echo "*** Setup Fish shell environment..."
echo "******* Installing fish shell..."
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install -y fish
echo "/usr/bin/fish" | sudo tee -a /etc/shells

chsh -s /usr/bin/fish
