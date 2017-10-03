function rst
    echo -ne '\ec\e[3J'
    commandline -f repaint
    fish_greeting
    echo "" | eval $CPCLIPBOARD -selection clipboard
end
