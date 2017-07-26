function genpsw
    date +%s | sha256sum | base64 | head -c $argv
    echo
end

