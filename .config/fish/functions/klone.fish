
function klone -d "Create all structure for a worktree workflow clone"
# We tell argparse about -h/--help and -s/--second - these are short and long forms of the same option.
    # The "--" here is mandatory, it tells it from where to read the arguments.
    argparse h/help n/name b/branch -- $argv
    # exit if argparse failed because it found an option it didn't recognize - it will print an error
    or return

    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        echo "klone [-h|--help] <url_to_repo> [-n|--name <repo_name>] [-b|--branch <branch_to_checkout>]"
        return 0
    end

    if not set -ql _flag_name
        set -g name (string split -r "/" "$argv[1]")[-1]
    end

    if not set -ql _flag_branch
        set -g branch $GIT_MAIN_LOCAL
    end

    if not test $argv[1]
        echo "url to repo is required"
        return 1
    else
        set -g url $argv[1]
    end

    set -l bare_dir .bare
    mkdir "$name"
    cd "$name"

    printf "Cloning repo %s\n" "$url"
    git clone --bare --recurse-submodules "$url" "$bare_dir"
    echo "gitdir: ./$bare_dir" > .git

    git config "remote.$GIT_MAIN_REMOTE.fetch" "+refs/heads/*:refs/remotes/$GIT_MAIN_REMOTE/*"

    git fetch "$GIT_MAIN_REMOTE"

    # set -l has_remote_branch (git ls-remote --heads $url refs/heads/$branch | wc -l | string trim)

    printf "Creating worktree %s\n" "$branch"
    # printf "Has remote branch: %s\n" "$has_remote_branch"
    # if test -n "$has_remote_branch"
    #     git worktree add --track "$branch" "./$branch" "$GIT_MAIN_REMOTE/$branch"
    # else
        git worktree add "./$branch" "$branch"
    # end

    if test -e "$branch/package.json"
        npm i
        set -g first_file "$branch/package.json"
    else if test -e "$branch/README.md"
        set -g first_file "$branch/README.md"
    else if test -e "$branch/.gitignore"
        set -g first_file "$branch/.gitignore"
    else
        set -g first_file "$branch/"
    end

    git identity "$IDENTITY"

    nvim "$first_file"
end
