function l
    switch (uname)
        case "Linux"
            if set -q argv[1]
                tmux send-keys -t "$pane" C-a "ls -lah --color=always $argv[1] | less -R" Enter
            else
                 tmux send-keys -t "$pane" C-a 'ls -lah --color=always | less -R' Enter
            end
        case "Darwin"
            if set -q argv[1]
                tmux send-keys -t "$pane" C-a "ls -lah -G $argv[1] | less -R" Enter
            else
                tmux send-keys -t "$pane" C-a 'ls -lah -G | less -R' Enter
            end
    end
end
