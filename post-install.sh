#! /bin/bash
echo "******* Installing fisher pkg manager..."
brew install fisher

echo "******* Installing nvm node version manager..."
fisher install edc/bass
fisher install PatrickF1/fzf.fish
brew install nvm
fisher install jorgebucaran/nvm.fish

pip3 install --user --upgrade neovim
pip3 install --user --upgrade neovim-remote
pip3 install --upgrade pip

cd
git clone git@mygithub:componhead/.tmux.git
./tmux-config/install.sh

yarn global add diagnostic-languageserver

sudo chmod 755 ~
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/*
sudo chmod 644 ~/.ssh/*.pub
sudo chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
sudo chown -R (whoami):staff .ssh/

mkdir ~/opt
git clone git@mygithub:componhead/intellijidea-settings.git ~/opt/intellijidea-settinga
