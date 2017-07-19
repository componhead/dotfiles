function reset
    echo -ne '\ec\e[3J'
    commandline -f repaint
    fish_greeting
end
