function sudoku
    if set -q argv[1]
        echo sudo $history[$argv[1]]
        sudo $history[$argv[1]]
    else
        echo sudo $history[1]
        sudo $history[1]
    end
end
