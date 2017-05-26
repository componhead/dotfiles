#!/usr/bin/env bash

# Installation on UBUNTU (14.04+)
BASE_DIR=$(dirname $0)
PARENT_DIR=$(dirname $BASE_DIR)

echo "Installing git..."
sudo apt-get install git-core

echo "Installing curl..."
sudo apt-get install curl

echo "Installing Antigen..."
rm -fr ${HOME}/.antigen
git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen

echo "Installing dein.vim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ${HOME}

echo "Installing zsh..."
sudo apt-get install zsh

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s `which zsh`

echo "Installing Neovim..."
sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

echo "Installing generics dot configuration files"
ln -sf ${PARENT_DIR}/.oh-my-zsh_custom_themes/emiliano.zsh-theme ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/emiliano.zsh-theme
ln -sf ${PARENT_DIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${PARENT_DIR}/.zshenv ${HOME}/.zshenv
ln -sf ${PARENT_DIR}/.docker ${HOME}/.docker
ln -sf ${PARENT_DIR}/.dockerignore ${HOME}/.dockerignore
ln -sf ${PARENT_DIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${PARENT_DIR}/.gitignore_global ${HOME}/.gitignore_global
ln -sf ${PARENT_DIR}/.ghci ${HOME}/.ghci
ln -sf ${PARENT_DIR}/ghci.conf ${HOME}/ghci.conf
ln -sf ${PARENT_DIR}/.git_template ${HOME}/.git_template
ln -sf ${PARENT_DIR}/.netrc.gpg ${HOME}/.netrc.gpg
ln -sf ${PARENT_DIR}/.scalafmt ${HOME}/.scalafmt
ln -sf ${PARENT_DIR}/.vimperatorrc ${HOME}/.vimperatorrc
ln -sf ${PARENT_DIR}/nvim/init.vim ${HOME}/.vimrc
ln -sf ${PARENT_DIR}/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
ln -sf ${PARENT_DIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${PARENT_DIR}/manuali ${HOME}/manuali
ln -sf ${PARENT_DIR}/appunti ${HOME}/appunti
cp -f ${PARENT_DIR}/.ssh/config ${HOME}/.ssh

echo "Installing specifics dot configuration files"
ln -sf ${BASE_DIR}/.zshrc ${HOME}/.zshrc
ln -sf ${BASE_DIR}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${BASE_DIR}/.vimperatorsys ${HOME}/.vimperatorsys
