function rst
    clear
    echo -ne '\ec\e[3J'
    commandline -f repaint
    fish_greeting
    echo "" | eval $CPCLIPBOARD_CMD
end
