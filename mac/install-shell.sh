#!/usr/bin/env bash

DOTFILESDIR=${HOME}/dotfiles

brew help > /dev/null;

if [ $? -eq 0 ]; then
    echo "Homebrew already installed"
else
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

if [[ -d ${HOME}/.antigen ]]; then
    echo "Antigen already installed"
else
    echo "Installing Antigen..."
    git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen
fi

if [[ -d ${HOME}/dein.vim ]]; then
    echo "Dein.vim already installed"
else
    echo "Installing dein.vim..."
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ${HOME}
fi

if brew ls --versions zsh > /dev/null; then
    echo "Zsh already installed"
else
    echo "Installing Zsh..."
    brew install zsh zsh-completions
    chsh -s $(which zsh)
fi

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.vimrc
ln -sf ${DOTFILESDIR}/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
ln -sf ${DOTFILESDIR}/.zshrc ${HOME}/.zshrc
ln -sf ${DOTFILESDIR}/.docker ${HOME}/.docker
ln -sf ${DOTFILESDIR}/.dockerignore ${HOME}/.dockerignore
ln -sf ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
ln -sf ${DOTFILESDIR}/.ghci ${HOME}/.ghci
ln -sf ${DOTFILESDIR}/ghci.conf ${HOME}/ghci.conf
ln -sf ${DOTFILESDIR}/.git_template ${HOME}/.git_template
ln -sf ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
ln -sf ${DOTFILESDIR}/.vimperatorrc ${HOME}/.vimperatorrc
ln -sf ${DOTFILESDIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${DOTFILESDIR}/manuali ${HOME}/manuali
ln -sf ${DOTFILESDIR}/appunti ${HOME}/appunti
ln -sf  ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config

echo "Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/mac/.zshenv ${HOME}/.zshenv
ln -sf ${DOTFILESDIR}/mac/.osx ${HOME}/.osx
ln -sf ${DOTFILESDIR}/mac/.profile ${HOME}/.profile
ln -sf ${DOTFILESDIR}/mac/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/mac/.vimperatorsys ${HOME}/.vimperatorsys
