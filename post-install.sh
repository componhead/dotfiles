#! /bin/bash
echo "******* Installing fisher pkg manager..."
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo "******* Installing nvm node version manager..."
fisher add edc/bass
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

pip3 install --user --upgrade neovim
pip3 install --user --upgrade neovim-remote
pip3 install --upgrade pip

# If in WSL:
# > mv /home/USER/.local/share/omf/pkg/bobthefish /home/USER/.local/share/omf/themes/bobthefish
# > omf theme bobthefish

sudo chmod 755 ~
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/*
sudo chmod 644 ~/.ssh/*.pub
sudo chmod 644 ~/.ssh/authorized_keys ~/.ssh/config
sudo chown -R (whoami):staff .ssh/

