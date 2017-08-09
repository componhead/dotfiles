function genpsw
    set -g digitseeds 1 2 3 4 5 6 7 8 9 0
    set -g alfaseeds q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D F G H J K L Z X C V B N M
    set -g hexseeds 1 2 3 4 5 6 7 8 9 0 a b c d e f
    set -g specialseeds \! \@ \# \$ \% \^ \& \* \( \) \_ \+ \- \= \: \" \| \; \' \< \> \? \, \. \/ \~ \` \{ \} \[ \]
    set -g seeds $digitseeds $alfaseeds $specialseeds
    if set -q argv[2]
        switch $argv[2]
            case "an"
                set -g seeds $digitseeds $alfaseeds
            case 'a'
                set -g seeds $alfaseeds
            case 'n'
                set -g seeds $digitseeds
            case 'h'
                set -g seeds $hexseeds
        end
    end
    set -g rndm ''
    for i in (seq 1 1 $argv[1])
       set -l r random 1 1 (count $seeds)
       set -l randomchar $seeds[(eval $r)]
       set -g rndm $rndm$randomchar
    end
    echo $rndm
    echo $rndm | eval $CPCLIPBOARD -selection clipboard
end

