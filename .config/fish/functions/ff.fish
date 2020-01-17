function ff
    if set -q argv[1]
        fzf --preview 'head -$argv[1] {}' --height $argv[1] -m | while read -l r; set result $result $r; end; and vim $result
    else
        fzf --preview 'head -80 {}' -m | while read -l r; set result $result $r; end; and vim $result
    end
end

