function ff
        fzf --preview 'head -80 {}' -m | while read -l r; set result $result $r; end; and nvim $result
end

