#! /bin/bash
echo "******* Installing fisher pkg manager..."
brew install fisher

echo "******* Installing nvm node version manager..."
fisher add edc/bass
fisher add PatrickF1/fzf.fish
brew install nvm
fisher install jorgebucaran/nvm.fish

pip3 install --user --upgrade neovim
pip3 install --user --upgrade neovim-remote
pip3 install --upgrade pip

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.neovim

cd
git clone git@mygithub:componhead/.tmux.git
./tmux-config/install.sh

yarn global add diagnostic-languageserver

# If in WSL:
# > mv /home/USER/.local/share/omf/pkg/bobthefish /home/USER/.local/share/omf/themes/bobthefish
# > omf theme bobthefish

sudo chmod 755 ~
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/*
sudo chmod 644 ~/.ssh/*.pub
sudo chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
sudo chown -R (whoami):staff .ssh/

mkdir ~/opt

git clone git@mygithub:componhead/intellijidea-settings.git ~/opt/

brew install --cask 1password/tap/1password-cli
