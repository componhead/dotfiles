function struct-clone-worktree -d "Create all structure for a worktree workflow clone" --argument-names url name
    # if test -z name
    #     echo "url, project name and branch name are required"
    #     exit
    # end


    mkdir $name
    cd "$name"

    # Moves all the administrative git files (a.k.a $GIT_DIR) under .bare directory.
    #
    # Plan is to create worktrees as siblings of this directory.
    # Example targeted structure:
    # .bare
    # main
    # new-awesome-feature
    # hotfix-bug-12
    # ...
    git clone --bare "$url" .bare
    echo "gitdir: ./.bare" > .git

    # Explicitly sets the remote origin fetch so we can fetch remote branches
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

    # Gets all branches from origin
    git fetch origin
    
    git worktree add master

    cd master

    git submodule update --remote --init

    git identity (echo $IDENTITY)

    nvim master/
end

