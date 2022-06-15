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

if brew ls --versions gitmoji > /dev/null; then
  echo "******* Gitmoji already installed"
else
  echo "******* Installing gitmoji..."
  brew install git
fi

if brew ls --versions curl > /dev/null; then
  echo "******* curl already installed"
else
  echo "******* Installing curl..."
  brew install curl
fi

if brew ls --versions python3 > /dev/null; then
  echo "******* Python3 already installed"
else
  echo "******* Installing python3..."
  brew install python3
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

if brew ls --versions fzf; then
  echo "******* fzf already installed"
else
  echo "******* Installing fzf"
  brew install fzf
fi

if brew ls --versions fd; then
  echo "******* fd already installed"
else
  echo "******* Installing fd"
  brew install fd
fi

echo "******* Installing bitbucket-cli."
pip install bitbucket-cli

echo "******* Installing Nerd Fonts"
brew tap caskroom/fonts
brew install --cask font-firacode-nerd-font-mono
brew install --cask font-jetbrains-mono

if brew ls --versions neovim > /dev/null; then
  echo "******* Neovim already installed"
else
  echo "******* Installing Neovim..."
  brew install neovim
fi

if brew ls --versions tmux > dev/null; then
  echo "******* Tmux already installed"
else
  echo "******* Installing tmux..."
  brew install tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/epm
  brew install reattach-to-user-namespace
fi

echo "******* Installing Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if brew ls --versions ripgrep > /dev/null; then
  echo "******* Ripgrep already installed"
else
  echo "******* Installing Ripgrep..."
  brew install ripgrep
fi

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

if brew ls --versions sed > /dev/null; then
  echo "******* Gnu-sed already installed"
else
  echo "******* Installing gnu-sed..."
  brew install gnu-sed --with-default-names
fi

if brew ls --versions thefuck > /dev/null; then
  echo "******* thefuck already installed"
else
  echo "******* Installing thefuck..."
  brew install thefuck
fi

if brew ls --versions emojify > /dev/null; then
  echo "******* emojify already installed"
else
  echo "******* Installing emojify..."
  brew install emojify
fi

if brew ls --versions source-highlight > /dev/null; then
  echo "******* source-highlight already installed"
else
  echo "******* Installing source-highlight..."
  brew install source-highlight
fi

if brew ls --versions starship > /dev/null; then
  echo "******* starship already installed"
else
  echo "******* Installing starship..."
  brew install starship
fi

if brew ls --versions fnm > /dev/null; then
  echo "******* fnm already installed"
else
  echo "******* Installing fnm..."
  brew install fnm
fi

if brew ls --versions tree > /dev/null; then
  echo "******* tree already installed"
else
  echo "******* Installing tree..."
  brew install tree
fi

curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

echo "******* Installing generics dot configuration files"
cp ${DOTFILESDIR}/mac/Library/Preferences/* ~/Library/Preferences/
ln -sf ${DOTFILESDIR}/.docker ${HOME}/.docker
ln -sf ${DOTFILESDIR}/.dockerignore ${HOME}/.dockerignore
ln -sf ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
ln -sf ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
ln -sf ${DOTFILESDIR}/.ghci ${HOME}/.ghci
ln -sf ${DOTFILESDIR}/ghci.conf ${HOME}/ghci.conf
ln -sf ${DOTFILESDIR}/.git_template ${HOME}/
ln -sf ${DOTFILESDIR}/.vimsessions ${HOME}/.vimsessions
ln -sf ${DOTFILESDIR}/manuali ${HOME}/
ln -sf ${DOTFILESDIR}/appunti ${HOME}/
ln -sf ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/
ln -sf ${SPECIFIC_DOTFILES}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/.config/nvim ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/alacritty ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/karabiner ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/fish ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/fisher ${HOME}/.config/
ln -sf ${DOTFILESDIR}/.config/starship.toml ${HOME}/.config/

echo "******* Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/mac/.osx ${HOME}/.osx
ln -sf ${SPECIFIC_DOTFILES}/.profile ${HOME}/.profile

echo "******* Setup Fish shell environment..."
if brew ls --versions fish > /dev/null; then
  echo "******* fish already installed"
else
  echo "******* Installing fish shell..."
  brew install fish
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi