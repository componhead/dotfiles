#! /usr/bin/fish
echo "******* Installing SpaceVim..."
curl -sLf https://spacevim.org/install.sh | bash

echo "******* Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
fish ~/install --path=~/.local/share/omf --config=~/.config/omf
rm ~/install

echo "******* Installing omf plugins..."
omf install \
    fzf \
    bobthefish \
    fish_logo \
    ssh-term-helper

# If in WSL:
# > mv /home/USER/.local/share/omf/pkg/bobthefish /home/USER/.local/share/omf/themes/bobthefish
# > omf theme bobthefish
