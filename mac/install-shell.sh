#!/bin/bash

DOTFILESDIR=${HOME}/dotfiles

brew help > /dev/null;

if [ $? -eq 0 ]; then
    echo "******* Homebrew already installed"
else
    echo "******* Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if brew ls --versions git > /dev/null; then
    echo "******* Git already installed"
else
    echo "******* Installing git..."
    brew install git
fi

if brew ls --versions curl > /dev/null; then
    echo "******* curl already installed"
else
    echo "******* Installing curl..."
    brew install curl
fi

echo "******* Installing Fura Fontee."
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font-mono

if brew ls --versions neovim > /dev/null; then
    echo "******* Neovim already installed"
else
    echo "******* Installing Neovim..."
    brew install neovim/neovim/neovim
fi

if brew ls --versions tmux > dev/null; then
    echo "******* Tmux already installed"
else
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "******* Installing Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if brew ls --versions ripgrep > /dev/null; then
    echo "******* Ripgrep already installed"
else
    echo "******* Installing Ripgrep..."
    brew install ripgrep
fi

echo "******* Installing autocompletion docker"
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

if brew ls --versions pinentry > /dev/null; then
    echo "******* Pinentry already installed"
else
    echo "******* Installing Pinentry..."
    brew install pinentry
fi

if brew ls --versions gpgme > /dev/null; then
    echo "******* Gpgme already installed"
else
    echo "******* Installing Gpgme..."
    brew install gpgme
fi

if brew ls --versions gpg-agent > /dev/null; then
    echo "******* Gpg-agent already installed"
else
    echo "******* Installing Gpg-agent..."
    brew install gpg-agent
fi

if brew ls --versions fpp > /dev/null; then
    echo "******* Facebook PathPicker already installed"
else
    echo "******* Installing Facebook PathPicker..."
    brew install fpp
fi

brew install source-highlight

curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing generics dot configuration files"
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
ln -sf ${DOTFILESDIR}/.git_template ${HOME}/
ln -sf ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
ln -sf ${DOTFILESDIR}/.vimperatorrc ${HOME}/.vimperatorrc
ln -sf ${DOTFILESDIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${DOTFILESDIR}/manuali ${HOME}/
ln -sf ${DOTFILESDIR}/appunti ${HOME}/
ln -sf ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
rm -r ${HOME}/.config/omf
ln -sf ${DOTFILESDIR}/.config/omf ${HOME}/.config
rm -r ${HOME}/.config/fish
ln -sf ${DOTFILESDIR}/.config/fish ${HOME}/.config
ln -sf ${DOTFILESDIR}/.tmux.conf ${HOME}/.tmux.conf

echo "******* Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/mac/.zshenv ${HOME}/.zshenv
ln -sf ${DOTFILESDIR}/mac/.osx ${HOME}/.osx
ln -sf ${DOTFILESDIR}/mac/.profile ${HOME}/.profile
ln -sf ${DOTFILESDIR}/mac/.vimperatorsys ${HOME}/.vimperatorsys

echo "******* Setup Fish shell environment..."
if brew ls --versions fish > /dev/null; then
    echo "******* fish already installed"
else
    echo "******* Installing fish shell..."
    brew install fish
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish

    echo "******* Installing oh-my-fish shell..."
    curl -L https://get.oh-my.fish > ~/install
    fish ~/install --path=~/.local/share/omf --config=~/.config/omf

    echo "******* Installing omf plugins..."
    omg install fzf
    omg install bang-bang
    omg install bobthefish
fi
