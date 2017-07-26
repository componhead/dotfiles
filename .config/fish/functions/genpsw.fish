function genpsw
    set psw (date +%s | shasum | base64 | head -c $argv)
    echo $psw
    echo $psw | eval $CPCLIPBOARD -selection clipboard
end

