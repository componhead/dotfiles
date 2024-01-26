function genmac
    set macaddr (genpsw 12 h | sed 's/\(..\)/\1:/g; s/.$//')
    echo $macaddr
    echo $macaddr | eval $CPCLIPBOARD -selection clipboard
end

