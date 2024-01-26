function rst --description "reset terminal to top"
    echo -ne '\ec\e[3J'
    fish_greeting
end

