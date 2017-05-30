#!/usr/bin/env bash

# Installation on UBUNTU (14.04+)
DOTFILESDIR=${HOME}/dotfiles

if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing git..."
    sudo apt-get install git-core
fi

if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing curl..."
    sudo apt-get install curl
fi

if [[ ! -d ${HOME}/.antigen ]]
then
    echo "Installing Antigen..."
    git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen
fi

if [[ ! -d ${HOME}/dein.vim ]]
then
    echo "Installing dein.vim..."
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ${HOME}
fi


if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing zsh..."
    sudo apt-get install zsh
fi

if [[ ! -d  ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/ ]];
then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh -s `which zsh`
fi

if [ $(dpkg-query -W -f='${Status}' neovim 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
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
fi

#echo "Installing Rust..."
#curl -sSf https://static.rust-lang.org/rustup.sh | sh
#
#echo "Installin Ripgrep..."
#cargo install ripgrep

echo "Installing generics dot configuration files"
ln -sf ${DOTFILESDIR}/.oh-my-zsh_custom_themes/emiliano.zsh-theme ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/emiliano.zsh-theme
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${DOTFILESDIR}/.zshrc ${HOME}/.zshrc
ln -sf ${DOTFILESDIR}/.dockerignore ${HOME}/.dockerignore
ln -sf ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
ln -sf ${DOTFILESDIR}/.ghci ${HOME}/.ghci
ln -sf ${DOTFILESDIR}/ghci.conf ${HOME}/ghci.conf
ln -sf ${DOTFILESDIR}/.git_template ${HOME}/.git_template
ln -sf ${DOTFILESDIR}/.netrc.gpg ${HOME}/.netrc.gpg
ln -sf ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
ln -sf ${DOTFILESDIR}/.vimperatorrc ${HOME}/.vimperatorrc
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.vimrc
ln -sf ${DOTFILESDIR}/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
ln -sf ${DOTFILESDIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${DOTFILESDIR}/manuali ${HOME}/manuali
ln -sf ${DOTFILESDIR}/appunti ${HOME}/appunti
cp -f ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh

echo "Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/lnx/.zshenv ${HOME}/.zshenv
ln -sf ${DOTFILESDIR}/lnx/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/lnx/.vimperatorsys ${HOME}/.vimperatorsys
