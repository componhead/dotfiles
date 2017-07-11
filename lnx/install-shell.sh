#!/usr/bin/env bash

# Installation on UBUNTU (14.04+)
DOTFILESDIR=${HOME}/dotfiles

mkdir ~/bin

if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing git..."
    sudo apt-get install -y git-core
fi

if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing curl..."
    sudo apt-get install -y curl
fi

echo "Installing fonts..."
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/BitstreamVeraSansMono.zip"
if [ ! -d ~/.fonts ]
then
    mkdir ~/.fonts
fi
unzip BitstreamVeraSansMono.zip -d ~/.fonts
rm BitstreamVeraSansMono.zip
sudo fc-cache -fv

if [[ ! -d ${HOME}/.antigen ]]
then
    echo "Installing Antigen..."
    git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen
fi

echo "Installing neovim Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing zsh..."
    sudo apt-get install -y zsh
fi

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing fish shell..."
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install -y fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo "Installing oh-my-fish shell..."
curl -L https://get.oh-my.fish > ~/install
fish ~/install --path=~/.local/share/omf --config=~/.config/omf

echo "Installing omf plugins..."
omg install fzf bang-bang bobthefish

echo "Installing gpg tools..."
sudo apt-get install -y gpgv2 gnupg2 gnupg-agent gnupg-doc pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

if [ $(dpkg-query -W -f='${Status}' neovim 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installing Neovim..."
    sudo apt-get install software-properties-common
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
fi

if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt-get install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ $(dpkg-query -W -f='${Status}' unzip 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt-get install unzip
fi

if [ $(dpkg-query -W -f='${Status}' colortail 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt-get install colortail
fi

if [ $(dpkg-query -W -f='${Status}' colordiff 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt-get install colordiff
fi

echo "Installing Ripgrep..."
wget https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
mv ripgrep-0.5.2-x86_64-unknown-linux-musl/rg ~/bin
rm -r ripgrep-0.5.2-x86_64-unknown-linux-musl*

echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker $(whoami)

echo "Installing zsh completion docker..."
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

echo "Installing xsel..."
sudo apt-get install xsel

echo "Installing Facebook PathPicker in ~/bin..."
cd ~/bin
wget https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
tar xzvf fpp.0.7.2.tar.gz
rm fpp.0.7.2.tar.gz
cd ~

echo "Installing generics dot configuration files..."
ln -sf ${DOTFILESDIR}/.oh-my-zsh_custom_themes/emiliano.zsh-theme ${HOME}/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/emiliano.zsh-theme
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.config/nvim/init.vim
ln -sf ${DOTFILESDIR}/nvim/init.vim ${HOME}/.vimrc
ln -sf ${DOTFILESDIR}/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
ln -sf ${DOTFILESDIR}/.zshrc ${HOME}/.zshrc
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
rm -r $HOME/.config/omf
ln -sf ${DOTFILESDIR}/.config/omf $HOME/.config
rm -r $HOME/.config/fish
ln -sf ${DOTFILESDIR}/.config/fish $HOME/.config

echo "Installing specifics dot configuration files"
ln -sf ${DOTFILESDIR}/lnx/.zshenv ${HOME}/.zshenv
ln -sf ${DOTFILESDIR}/lnx/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DOTFILESDIR}/lnx/.vimperatorsys ${HOME}/.vimperatorsys
