function rst
    clear
    echo -ne '\ec\e[3J'
    commandline -f repaint
    echo "" | eval $CPCLIPBOARD_CMD
end
