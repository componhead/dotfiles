function genpsw
    set psw (date +%s | sha256sum | base64 | head -c $argv)
    echo $psw
    echo $psw | eval $CPCLIPBOARD -selection clipboard
end

