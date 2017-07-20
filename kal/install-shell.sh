#!/usr/bin/env bash

# Installation on KALI ROLLING as root user
DOTFILESDIR=${HOME}/dotfiles

if [ ! -d ~/.local ]
then
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share
fi

if [ ! -d ~/.config ]
then
    mkdir ~/.config
fi

if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "git already installed") -eq 0 ];
then
    echo "******* Installing git..."
    apt-get install -y git-core
fi

if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "curl already installed") -eq 0 ];
then
    echo "******* Installing curl..."
    apt-get install -y curl
fi

echo "******* Installing Fura Nerd font..."
if [ ! -d /usr/share/fonts/opentype ]
then
    mkdir -p /usr/share/fonts/opentype/FuraCodeRegularNerd
fi

curl -o /usr/share/fonts/opentype/FuraCodeRegularNerd/Fura\ Code\ Regular\ Nerd\ Complete.otf --create-dirs https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fura\ Code\ Regular\ Nerd\ Font\ Complete.otf
fc-cache -fv

echo "******* Installing neovim Plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "******* Installing gpg tools..."
apt-get install -y gpgv2 gnupg2 gnupg-agent pinentry-curses
curl -o ~/.local/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc
chmod +x ~/.local/bin/git-credential-netrc

if [ $(dpkg-query -W -f='${Status}' neovim 2>/dev/null | grep -c "neovim already installed") -eq 0 ];
then
    echo "******* Installing Neovim..."
    apt-get install -y software-properties-common
    apt-get install -y python-dev python-pip python3-dev python3-pip
    add-apt-repository ppa:neovim-ppa/stable
    apt-get update
    apt-get install -y neovim
    update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    #update-alternatives --config vi
    update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    #update-alternatives --config vim
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    #update-alternatives --config editor
fi

if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "tmux already installed") -eq 0 ];
then
    echo "******* Installing tmux..."
    apt-get install -y tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ $(dpkg-query -W -f='${Status}' unzip 2>/dev/null | grep -c "unzip already installed") -eq 0 ];
then
    echo "******* Installing unzip..."
    apt-get install -y unzip
fi

if [ $(dpkg-query -W -f='${Status}' colortail 2>/dev/null | grep -c "colortail already installed") -eq 0 ];
then
    echo "******* Installing colortail..."
    apt-get install -y colortail
fi

if [ $(dpkg-query -W -f='${Status}' colordiff 2>/dev/null | grep -c "colordiff already installed") -eq 0 ];
then
    echo "******* Installing colordiff..."
    apt-get install -y colordiff
fi

if [ $(dpkg-query -W -f='${Status}' xsel 2>/dev/null | grep -c "xsel already installed") -eq 0 ];
then
    echo "******* Installing xsel..."
    apt-get install xsel
fi

if [ $(dpkg-query -W -f='${Status}' xclip 2>/dev/null | grep -c "xclip already installed") -eq 0 ];
then
    echo "******* Installing xclip..."
    apt-get install xclip
fi

echo "******* Installing Facebook PathPicker in ~/bin..."
wget -O ~/fpp.tar.gz https://github.com/facebook/PathPicker/releases/download/0.7.2/fpp.0.7.2.tar.gz
tar xzvf ~/fpp.tar.gz ~/.local/bin
rm ~/fpp.tar.gz

echo "******* Setup Fish shell environment..."
if [ $(dpkg-query -W -f='${Status}' fish 2>/dev/null | grep -c "fish already installed") -eq 0 ];
then
    echo "******* Installing fish shell..."
    apt-add-repository ppa:fish-shell/release-2
    apt-get update
    apt-get install -y fish
    echo "/usr/bin/fish" | tee -a /etc/shells

    echo "******* Installing oh-my-fish shell..."
    curl -L https://get.oh-my.fish > ~/install
    /usr/bin/fish ~/install --path=~/.local/share/omf --config=~/.config/omf
    rm ~/install

    echo "******* Installing omf plugins..."
    omf install fzf bang-bang bobthefish

    rm -r $HOME/.config/omf
    rm -r $HOME/.config/fish
fi

echo "Installing Ripgrep..."
wget -O ~/bin/ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ~/bin/ripgrep.tar.gz -C ~/bin
mv ~/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg ~/bin
mv ~/bin/ripgrep-0.5.2-x86_64-unknown-linux-musl/complete/rg.fish ~/.config/fish/functions/
rm -rf ripgrep-0.5.2-x86_64-unknown-linux-musl

apt autoremove -y

echo "******* Cpying generics dot configuration files..."
cp -fr ${DOTFILESDIR}/.config/nvim ${HOME}/.config/nvim
cp -f ${DOTFILESDIR}/.config/nvim/init.vim ${HOME}/.vimrc
cp -f ${DOTFILESDIR}/.config/nvim/nvim_plugins.vim  ${HOME}/nvim_plugins.vim
cp -f ${DOTFILESDIR}/.gitconfig ${HOME}/.gitconfig
cp -f ${DOTFILESDIR}/.gitignore_global ${HOME}/.gitignore_global
cp -f ${DOTFILESDIR}/.git_template ${HOME}/
cp -f ${DOTFILESDIR}/.scalafmt ${HOME}/.scalafmt
cp -f ${DOTFILESDIR}/.ssh/config ${HOME}/.ssh/config
cp -f ${DOTFILESDIR}/.tmux.conf ${HOME}/.tmux.conf
cp -rf ${DOTFILESDIR}/.config/omf $HOME/.config
cp -rf ${DOTFILESDIR}/.config/fish $HOME/.config
ln -sf $HOME/.config/omf/init.fish $HOME/.config/fish/config.fish
rm -rf ${DOTFILESDIR}

chsh -s /usr/bin/fish
