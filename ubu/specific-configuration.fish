set -xg CPCLIPBOARD xclip
set -xg CPCLIPBOARD_CMD ((eval $CPCLIPBOARD) -selection clipboard)
set -xg TMUX_CLIPBOARD_COMMAND "xclip -sel clip -i"
set -xg LS_COLORS 'di=36:ln=32:so=30;47:pi=33:ex=30;42:bd=30;45:cd=0;45:su=30;44:sg=0;44:tw=30;41:ow=0;41'

abbr --add chr tmux new -s browser -n chrome -d google-chrome
abbr --add kchr tmux kill-session -tbrowser
