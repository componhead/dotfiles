#! /bin/bash
rm -rf ~/.local/share/omf
echo "******* Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
chmod +x ~/install
fish ~/install --path=~/.local/share/omf --config=~/.config/omf
rm ~/install

echo "******* Installing omf plugins..."
omf install fzf cmorrell fish_logo ssh-term-helper git-flow thefuck nvm

set -gx NVM_DIR (brew --prefix nvm)

ln -sf ~/.local/share/omf/themes/agnoster/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish 
ln -sf ~/fzf/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish

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

npm install -g npx
npx install-peerdeps --dev eslint-config-airbnb
