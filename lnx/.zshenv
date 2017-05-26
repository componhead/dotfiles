export DOTFILES="$HOME/opt/dotfiles"
export SPECIFICDOTFILES="$DOTFILES/lnx"
# WORK USER
work_usr_ig="ig\\IG04522"
work_usr_classig="class-ig\\IG04522"
# PRIME BLU
export B01="$work_usr_classig@prime-blue01.class-ig.local"
export B02="$work_usr_classig@prime-blue02.class-ig.local"
export Btest01="$work_usr_ig@10.123.38.125"
export Btest02="$work_usr_ig@10.123.38.129"
# PRIM GREEN
export G01="$work_usr_ig@10.123.2.238"
export G02="$work_usr_ig@10.123.2.239"
export Gtest01="$work_usr_ig@10.123.38.126"
export Gtest02="$work_usr_ig@10.123.38.130"
# FILTER
export Filter="$work_usr_ig@10.123.2.126"

export PRIME="$REPO/prime/"
export Blog="$PRIME/PrimeBlue/log"
export Glog="$PRIME/PrimeGreen/log"
export Clog="$PRIME/PrimeClient/log"
export Jlog="$HOME/jboss-prime/jboss-4.2.3.GA/server/tserver/log"

export ACCUREV_COMMAND_LOGFILE="~/.accurev/log"
# Servono per avere il nome della funzione nel tab tmux
logBlue() {
    less +F $Blog/prime-server.log
}
logGreen() {
    less +F $Glog/prime-server.log
}
logJboss() {
    less +F $Jlog/server.log
}
logClient() {
    less +F $Clog/prime-client.log
}

#alias less="nvim -u /usr/share/nvim/runtime/macros/less.vim"
alias primejb="$HOME/jboss-prime/jboss-4.2.3.GA/opt/jboss-manager.sh start"
alias repo="cd $REPO "
alias mags="cd $REPO/magspotter_server/Magspotter"
alias crypt="cd $REPO/crypt-x/ebiweb_backend"
alias tm="tmux attach"
alias brain="ssh onetech02@192.168.7.10"
alias play_local="play debug -Dlogger.file=conf/logger.xml -Dconfig.file=/home/eanichini/repo/magspotter_server/MagspotterDbConfigurations/local.conf run"
alias play_stage="play debug -Dlogger.file=conf/logger.xml -Dconfig.file=/home/eanichini/repo/magspotter_server/MagspotterDbConfigurations/stage.conf run"
alias play_main="play debug -Dconfig.file=/home/eanichini/repo/magspotter_server/MagspotterDbConfigurations/maintenance.conf run"
alias play_prod_dist="play -Dconfig.file=/home/eanichini/repo/magspotter_server/MagspotterDbConfigurations/prod.conf dist"
alias play_stage_dist="play -Dconfig.file=/home/eanichini/repo/magspotter_server/MagspotterDbConfigurations/stage.conf dist"
alias omegafix="xmodmap -e \"keycode 24 = q Q at at at at\""     # transformer Ω -> @
#COMMENTATO PERCHE ROMPE LA 's'
#alias sectionfix="xmodmap -e \"keycode 339 = o O oslash Oslash\"" # transformer ß -> §
alias l="ls --color -lah"

export PATH=$PATH:~/opt/activator/bin:~/opt/play-2.2.3:~/opt/ripgrep-0.3.2-x86_64-unknown-linux-musl/:~/scripts
export EDITOR=/usr/local/bin/nvim
export GIT_EDITOR=/usr/local/bin/nvim
export REPO="$HOME/repo"
export ECLIPSE_HOME="$HOME/eclipse/java-mars/eclim"
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

