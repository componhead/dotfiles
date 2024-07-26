function current_git_branch
    set -l branch (git rev-parse --abbrev-ref HEAD)
    string replace -r ' b ' (string join '' ' ' \#(string escape -- $branch) ' ') -- $argv[1]
end
