function genmac
    set macaddr (openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
    echo $macaddr
    echo $macaddr | eval $CPCLIPBOARD -selection clipboard
end

