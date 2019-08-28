#! /bin/bash
echo "******* Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
chmod +x ~/install
fish ~/install --path=~/.local/share/omf --config=~/.config/omf
rm ~/install

echo "******* Installing omf plugins..."
omf install fzf bobthefish fish_logo ssh-term-helper git-flow

ln -sf ~/.local/share/omf/themes/agnoster/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish 
ln -sf ~/fzf/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish

pip3 install --user --upgrade neovim
pip3 install --user --upgrade neovim-remote
pip3 install --upgrade pip

# If in WSL:
# > mv /home/USER/.local/share/omf/pkg/bobthefish /home/USER/.local/share/omf/themes/bobthefish
# > omf theme bobthefish
