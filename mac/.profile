# MacPorts Installer addition on 2015-04-18_at_12:39:35: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

source $HOME/bin/dotfiles/.oh-my-git/prompt.sh

# Added by Canopy installer on 2016-01-21
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make the bash prompt show that Canopy is active, otherwise 1
alias activate_canopy="source '/Users/3m1/Library/Enthought/Canopy_64bit/User/bin/activate'"
VIRTUAL_ENV_DISABLE_PROMPT=1 source '/Users/3m1/Library/Enthought/Canopy_64bit/User/bin/activate'

export PATH="$HOME/.cargo/bin:$PATH"
