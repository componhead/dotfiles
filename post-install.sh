#! /bin/bash
echo "******* Installing fisher pkg manager..."
brew install fisher

echo "******* Installing nvm node version manager..."
brew install nvm
fisher install jorgebucaran/nvm.fish

fisher install edc/bass
fisher install PatrickF1/fzf.fish

# cd
# git clone git@mygithub:componhead/.tmux.git
# ./tmux-config/install.sh

yarn global add diagnostic-languageserver

sudo chmod 755 ~
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/*
sudo chmod 644 ~/.ssh/*.pub
sudo chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
sudo chown -R (whoami):staff .ssh/

mkdir ~/opt

cp ${DOTFILES}/fonts/* ~/Library/Fonts/
ln -sf ${PRIVATE_DOTFILES}/(hostname)/.gnupg/gpg-agent.conf ${HOME}/.gnupg/
ln -sf ${PRIVATE_DOTFILES}/(hostname)/.gnupg/gpg.conf ${HOME}/.gnupg/

sh ( curl -L https://nixos.org/nix/install | psub) --daemon
fisher install lilyball/nix-env.fish
