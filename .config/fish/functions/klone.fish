function klone -d "Create all structure for a worktree workflow clone"
# We tell argparse about -h/--help and -s/--second - these are short and long forms of the same option.
    # The "--" here is mandatory, it tells it from where to read the arguments.
    argparse h/help u/url= r/repodir= -- $argv
    # exit if argparse failed because it found an option it didn't recognize - it will print an error
    or return

    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        printf "klone [-h|--help]\nklone -u|--url <url_to_repo>\n      [-r|--repodir <directory_name|last_segment_of_url>]"
        return 0
    end

    if set -ql _flag_url
        set -f url "$_flag_url"
    else
        echo "url to repo is required"
        return 1
    end

    if set -ql _flag_repodir
        set -f repo_dir "$_flag_repodir"
    else
        set -f repo_dir (string split -r "/" "$url")[-1]
    end
    printf "Repo dir: %s\n" "$repo_dir"

    set -l bare_dir ".bare"
    mkdir "$repo_dir"
    cd "$repo_dir"

    printf "Cloning repo %s\n" "$url"
    git clone --bare --recurse-submodules "$url" "$bare_dir"
    echo "gitdir: ./$bare_dir" > .git

    git config "remote.origin.fetch" "+refs/heads/*:refs/remotes/origin/*"

    git fetch origin

    printf "git worktree add ./$directory"
    set -l main_master (git rev-parse --abbrev-ref HEAD)
    printf "main_master: %s\n" "$main_master"
    git worktree add "./WORKING" "$main_master"

    if test -e "WORKING/package.json"
        npm i
        set -g first_file "WORKING/package.json"
    else if test -e "WORKING/README.md"
        set -g first_file "WORKING/README.md"
    else if test -e "WORKING/.gitignore"
        set -g first_file "WORKING/.gitignore"
    else
        set -g first_file "WORKING/"
    end

    git identity "$IDENTITY"

    nvim "$first_file"
end
