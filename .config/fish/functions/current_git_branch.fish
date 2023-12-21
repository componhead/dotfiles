function current_git_branch --description 'show current branch'
    set -l brc (git rev-parse --abbrev-ref HEAD)
    echo $brc
end
