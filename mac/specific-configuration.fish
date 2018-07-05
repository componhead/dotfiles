set -xg CPCLIPBOARD pbcopy
set -xg CPCLIPBOARD_CMD $CPCLIPBOARD -selection clipboard
set -xg TMUX_CLIPBOARD_COMMAND "reattach-to-user-namespace pbcopy"
set -xg LSCOLORS gxcxahdxacafxfaexeabxb
# put on private JAVA_HOME the resulting
# /usr/libexec/java_home -v 1.8

abbr --add qb ~/opt/qutebrowser/qutebrowser.py

