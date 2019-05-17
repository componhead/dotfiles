function gffp
    set issue (git branch | grep \* | cut -d ' ' -f2 | sed 's/.*\/\([0-9]*\)$/\1/')
    echo $(git flow feature publish $issue)
end

