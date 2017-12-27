#! /usr/bin/fish
echo "******* Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
/usr/bin/fish ~/install --path=~/.local/share/omf --config=~/.config/omf
rm ~/install

echo "******* Installing omf plugins..."
curl -L https://get.oh-my.fish > ~/install
omf install fzf bang-bang bobthefish fish_logo

# If in WSL:
# > mv /home/USER/.local/share/omf/pkg/bobthefish /home/USER/.local/share/omf/themes/bobthefish
# > omf theme bobthefish
