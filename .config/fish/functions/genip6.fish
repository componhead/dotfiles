function genip6
    set ip6 (genpsw 24 h | sed 's/\(....\)/\1:/g; s/.$//')
    echo $ip6
    echo $ip6 | eval $CPCLIPBOARD -selection clipboard
end
