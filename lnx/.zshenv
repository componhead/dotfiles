export DOTFILES="$HOME/dotfiles"
export SPECIFICDOTFILES="$DOTFILES/lnx"

#alias less="nvim -u /usr/share/nvim/runtime/macros/less.vim"
alias repo="cd $REPO"
alias tm="tmux attach"
alias omegafix="xmodmap -e \"keycode 24 = q Q at at at at\""     # transformer Ω -> @
#COMMENTATO PERCHE ROMPE LA 's'
#alias sectionfix="xmodmap -e \"keycode 339 = o O oslash Oslash\"" # transformer ß -> §

export PATH=$PATH:~/opt/activator/bin:~/opt/play-2.2.3:~/opt/ripgrep-0.5.2-x86_64-unknown-linux-musl/:~/scripts
export EDITOR=/usr/local/bin/nvim
export GIT_EDITOR=/usr/local/bin/nvim
export REPO="$HOME/repo"
export PYTHON="/usr/bin/python3.5"
export GITCREDENTIAL="gnome-keyring"

bindkey '^[[1;3D'      cdParentKey
bindkey '^[[1;3C'      cdUndoKey

source $DOTFILES/.general_zshenv

## Invoke GnuPG-Agent the first time we login.
## Does `~/.gpg-agent-info' exist and points to gpg-agent process accepting signals?
#if test -f $HOME/.gpg-agent-info && \
#    kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
#    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
#else
#    # No, gpg-agent not available; start gpg-agent
#    eval `gpg-agent --daemon --no-grab $HOME/.gpg-agent-info`
#fi
#export GPG_TTY=`tty`
#export GPG_AGENT_INFO

