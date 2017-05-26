## TMUXGUIDE
### Per creare una sessione development con una window editor
    tmux new -s development -n editor -d

### Per spostarsi in una directory nel pannello 1 della window 2 [session]:[window].[pane]
    tmux send-keys -t development:2.1 'cd ~/devproject' C-m

### Per chiudere la [sessione|window|pane] development dall'esterno
    tmux kill-[session|window|pane] -t development 

### Per salvare la clipboard di tmux nella clipboard di sistema
    tmux save-buffer - | [pbcopy|clipcopy]
