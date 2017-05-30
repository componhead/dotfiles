export REPO="$HOME/repo"
export CDPATH=:$HOME:$REPO
export MYSQL_HOME="/Applications/MAMP/Library/bin"
export SCALAFRM="$HOME/opt/scalafmt/cli/target/scala-2.11/scalafmt.jar"
export ECLIPSE_HOME="$HOME/eclipse"
export DOTFILES="$HOME/dotfiles"
export SPECIFICDOTFILES="$DOTFILES/mac"
#export PYTHONPATH="$HOME/Library/Python/3.5/lib/python/site-packages"
#export PYTHON="/Library/Frameworks/Python.framework/Versions/3.5/bin/python3"
export GITCREDENTIAL="osxkeychain"
export COURSERADL="$HOME/opt/coursera/coursera-dl"

bindkey '^[b' cdParentKey
bindkey '^[f' cdUndoKey

export PATH=$PATH:$SCALAFRM:$MYSQL_HOME:$COURSERADL:$PYTHONPATH:$DOTFILES

alias l="ls -lahG"
alias ..l="ls -lahG .."
alias .2l="ls -lahG ../../"
alias .3l="ls -lahG ../../../"
alias .4l="ls -lahG ../../../../"
alias macchanger="spoof "
alias less="nvim -u /usr/local/Cellar/neovim/0.1.7/share/nvim/runtime/macros/less.vim"
alias blogdir="cd /Applications/MAMP/htdocs/blog/"

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
else
  # No, gpg-agent not available; start gpg-agent
  eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
fi
export GPG_TTY=$(tty)
export GPG_AGENT_INFO

# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

source $DOTFILES/.general_zshenv
