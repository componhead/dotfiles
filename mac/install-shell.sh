#!/usr/bin/env bash

DOTFILESDIR=${HOME}/dotfiles

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if brew ls --versions git > /dev/null; then
    echo "Git already installed"
else
    echo "Installing git..."
    brew install git
fi

if brew ls --versions curl > /dev/null; then
    echo "curl already installed"
else
    echo "Installing curl..."
    brew install curl
fi

if [[ ! -d ${HOME}/.antigen ]]; then
    echo "Installing Antigen..."
    git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen
fi

if [[ ! -d ${HOME}/dein.vim ]]; then
    echo "Installing dein.vim..."
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ${HOME}
fi

if brew ls --versions zsh > /dev/null; then
    echo "Zsh already installed"
else
    echo "Installing zsh..."
    brew install zsh zsh-completions
    chsh -s $(which zsh)
fi

if [[ ! -d ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git ]]; then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if

if brew ls --versions neovim > /dev/null; then
    echo "Neovim already installed"
else
    echo "Installing Neovim..."
    brew install neovim/neovim/neovim
fi

if brew ls --versions zsh > /dev/null; then
    echo "Zsh already installed"
else
    echo "Installing zsh..."
    brew install zsh zsh-completions
    chsh -s $(which zsh)
fi

if brew ls --versions ripgrep > /dev/null; then
    echo "Ripgrep already installed"
else
    echo "Installing Ripgrep..."
    brew install ripgrep
fi

echo "Installing generics dot configuration files"
ln -sf ${DOTFILESDIR}/.oh-my-zsh_custom_themes/emiliano.zsh-theme ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/emiliano.zsh-theme
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${DOTFILESDIR}/.zshenv ${HOME}/.zshenv
ln -sf ${DOTFILESDIR}/.docker ${HOME}/.docker
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
cp -f  ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config

echo "Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/mac/.zshrc ${HOME}/.zshrc
ln -sf ${DOTFILESDIR}/mac/.osx ${HOME}/.osx
ln -sf ${DOTFILESDIR}/mac/.profile ${HOME}/.profile
ln -sf ${DOTFILESDIR}/mac/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/mac/.vimperatorsys ${HOME}/.vimperatorsys
ln -sf ${DOTFILESDIR}/mac/Library/Application Support/Karabiner/private.xml ${HOME}/Library/Application Support/Karabiner/private.xml
