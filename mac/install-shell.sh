#!/usr/bin/env bash

BASE_DIR=$(dirname $0)
PARENT_DIR=$(dirname $BASE_DIR)

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing git..."
brew install git

echo "Installing curl..."
brew install curl

echo "Installing Antigen..."
rm -fr ${HOME}/.antigen
git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen

echo "Installing dein.vim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ${HOME}

echo "Installing zsh..."
brew install zsh zsh-completions
chsh -s $(which zsh)

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing Neovim..."
brew install neovim/neovim/neovim

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
cp -f ${PARENT_DIR}/.ssh/config ${HOME}/.ssh/config

echo "Installing specifics dot configuration files"
ln -sf ${BASE_DIR}/.zshrc ${HOME}/.zshrc
ln -sf ${BASE_DIR}/.osx ${HOME}/.osx
ln -sf ${BASE_DIR}/.profile ${HOME}/.profile
ln -sf ${BASE_DIR}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${BASE_DIR}/.vimperatorsys ${HOME}/.vimperatorsys
ln -sf ${BASE_DIR}/Library/Application Support/Karabiner/private.xml ${HOME}/Library/Application Support/Karabiner/private.xml
