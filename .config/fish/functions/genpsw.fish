function genpsw
    openssl rand -base64 $argv | cut -c1-$argv
end

