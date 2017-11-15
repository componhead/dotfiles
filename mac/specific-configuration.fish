set -xg CPCLIPBOARD pbcopy
set -xg CPCLIPBOARD_CMD eval $CPCLIPBOARD -selection clipboard
set -xg TMUX_CLIPBOARD_COMMAND "reattach-to-user-namespace pbcopy"
set -xg LSCOLORS gxcxahdxacafxfaexeabxb

abbr --add qb ~/opt/qutebrowser/qutebrowser.py

