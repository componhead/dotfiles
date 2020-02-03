set -xg CPCLIPBOARD pbcopy
set -xg CPCLIPBOARD_CMD $CPCLIPBOARD -selection clipboard
set -xg TMUX_CLIPBOARD_COMMAND "reattach-to-user-namespace pbcopy"
set -xg LSCOLORS gxcxahdxacafxfaexeabxb
# put on private JAVA_HOME the resulting
# /usr/libexec/java_home -v 1.8
set -g fish_user_paths "/usr/local/opt/icu4c/bin" ~/.config/fish/config.fish
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" ~/.config/fish/config.fish

abbr --add qb ~/opt/qutebrowser/qutebrowser.py
abbr --add ubuntu_version lsb_release -idrc

