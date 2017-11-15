function rst
    clear
    echo -ne '\ec\e[3J'
    commandline -f repaint
    fish_greeting
    echo "" | $CPCLIPBOARD_CMD
end
