#!/usr/local/bin/fish

if test -z $DOTFILES
    # ############# DON'T TOUCH ALL BELOW
    set -xg DOTFILES $HOME/dotfiles
    # see https://standards.freedesktop.org/basiir-spec/basedir-spec-latest.html
    set -xg XDG_CONFIG_HOME $HOME/.config
    set -xg XDG_CONFIG_LINK $DOTFILES/.config
    set -xg XDG_DATA_HOME $HOME/.local/share
    set -xg XDG_DATA_DIRS /usr/local/share/:/usr/share/
    set -xg XDG_CONFIG_DIRS /etc/xdg
    #set -xg XDG_CACHE_HOME $HOME/cache

    set -xg EDITOR nvim
    set -xg GIT_PAGER delta
    set -xg GIT_EDITOR $EDITOR
    set -xg FPP_EDITOR $EDITOR
    set -xg BROWSER '/Applications/Google Chrome.app'

    set -xg NVIM_DIR $XDG_CONFIG_HOME/nvim
    set -xg FISH_DIR $XDG_CONFIG_HOME/fish
    set -xg TMUX_DIR $HOME/.tmux
    set -xg ALACRITTY_DIR $XDG_CONFIG_HOME/alacritty
    set -xg WEZTERM_DIR $XDG_CONFIG_HOME/wezterm
    set -xg ZELLIJ_DIR $XDG_CONFIG_HOME/zellij
    set -xg VIMRC $NVIM_DIR/init.lua
    set -xg GIT_CONFIG_HOME $XDG_CONFIG_HOME/git
    set -xg GIT_CONFIG_GLOBAL $GIT_CONFIG_HOME/config
    set -xg RCFILE $FISH_DIR/config.fish
    set -xg TMUXFILE $HOME/.tmux.conf
    set -xg ZELLIJ_FILE $ZELLIJ_DIR/config.kdl
    # ############# DON'T TOUCH ALL ABOVE

    set -xg APPDATA $HOME
    set -xg CLICOLOR 1
    set -xg CLICOLOR_FORCE 1
    set -xg CPCLIPBOARD pbcopy
    set -xg CPCLIPBOARD_CMD $CPCLIPBOARD -selection clipboard
    set -xg FZF_DEFAULT_OPTS --bind=ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up
    if type -q rg then
        set -xg FZF_FIND_FILE_COMMAND "rg --files --hidden --follow --glob '!.git'"
    end
    set -xg GIT_CURL_VERBOSE 0
    set -xg GIT_TRACE 0
    set -xg GPG_TTY (tty)
    set -xg GREP_COLOR '3;33'
    set -xg LANG en_US.UTF-8
    set -xg LC_CTYPE UTF-8
    set -xg LESS -R
    set -xg LESSCHARSET utf-8
    set -xg LSCOLORS gxcxahdxacafxfaexeabxb
    set -xg NVIM_PYTHON_LOG_FILE /tmp/log
    set -xg NVIM_PYTHON_LOG_LEVEL DEBUG
    set -xg OPENAI_API_HOST api.openai.com
    set -xg PYTHON /usr/local/bin/python3.9
    set -xg TMUX_CLIPBOARD_COMMAND "reattach-to-user-namespace pbcopy"

    set -xg PRIVATE_DOTFILES $DOTFILES/private_dotfiles/(hostname)

    set -gx PATH $PATH $HOME/bin $DOTFILES/bin

    set -g theme_display_git yes
    set -g theme_display_git_untracked yes
    set -g theme_display_git_ahead_verbose yes
    set -g theme_git_worktree_support yes
    set -g theme_display_vagrant yes
    set -g theme_display_docker_machine yes
    set -g theme_display_hg yes
    set -g theme_display_virtualenv yes
    set -g theme_display_ruby yes
    set -g theme_display_user yes
    set -g theme_display_vi yes
    set -g theme_display_date yes
    set -g theme_display_cmd_duration yes
    set -g theme_title_display_process yes
    set -g theme_title_display_path no
    set -g theme_title_display_user yes
    set -g theme_title_use_abbreviated_path no
    set -g theme_date_format "+%Y-%m-%d, %a, %H:%M:%S"
    set -g theme_avoid_ambiguous_glyphs yes
    set -g theme_powerline_fonts no
    set -g theme_nerd_fonts yes
    set -g theme_show_exit_status yes
    set -g theme_newline_cursor yes
    set -g fish_vi_key_bindings yes
    set -g fish_escape_delay_ms 300
    set -g fish_user_abbreviations
    set abbrs_initialized
    set fish_user_paths /usr/local/bin $HOME/.local/bin
    set -gx fish_tmux_config $TMUXFILE
    set fzf_preview_dir_cmd exa --all --color=always
    set fzf_fd_opts --hidden --exclude=.git

    source $PRIVATE_DOTFILES/privatefile
end

# ABBREVIAZIONI DOCKER
abbr -a dci "docker container info"
abbr -a dcn "docker container"
abbr -a dcs "docker container start"
abbr -a dcS "docker container stop"
abbr -a dil "docker images -a"
abbr -a dit "docker container exec -it"
abbr -a dim "docker image"
abbr -a dlg "docker container logs"
abbr -a dls "docker container ps -a"
abbr -a dpt "docker container port"

alias git="$GIT_CONFIG_HOME/gitwrapper.sh"
set -g GIT_MAIN_REMOTE 'origin'
set -g GIT_MAIN_LOCAL 'master'
# ABBREVIAZIONI GIT 
abbr -a g "git"
abbr -a gacm "git commit -am"
abbr -a gad "git add ."
abbr -a gb --position anywhere --function current_git_branch --regex '.*\sgb\s.*'
abbr -a gcf "git config -e"
abbr -a gcfg "git config --global -e"
abbr -a gcln "git clone --recursive"
abbr -a gcm "npx eslint --fix . 2>/dev/null; git add .; git commit -m'"
abbr -a gcma "git commit --amend"
abbr -a gcmx "git commit --amend --no-edit --no-verify"
abbr -a gco "git checkout -b "
abbr -a gcom "git checkout $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a gdf "git difftool --diff-filter=M"
abbr -a gdfm "git difftool $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a gds "git difftool --name-status"
abbr -a gf "git fetch --all --recurse-submodules=yes"
abbr -a gfrst "git checkout $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL --"
abbr -a gig "$GIT_EDITOR $GIT_CONFIG_HOME/ignore"
abbr -a ginsk "git update-index --no-skip-worktree"
abbr -a gisk "git update-index --skip-worktree"
abbr -a gl "git log --color --decorate --graph --all --oneline"
abbr -a gls "git ls-files -v . | grep \^S | less"
abbr -a gmrga "git merge --abort"
abbr -a gmrgc "git add . && git merge --continue"
abbr -a gmrgm "git merge $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a gmrgo "git merge -s recursive -Xours --autostash"
abbr -a gmrgt "git merge -s recursive -Xtheirs --autostash"
abbr -a grbsa "git rebase --abort"
abbr -a grbsc "git add . && git rebase --continue"
abbr -a grbsm "git rebase $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a grbso "git rebase -s recursive -Xours --autostash"
abbr -a grbst "git rebase -s recursive -Xtheirs --autostash"
abbr -a grest "git restore . --recurse-submodules"
abbr -a groot "cd (git rev-parse --show-toplevel)"
abbr -a grst "git reset --hard (git rev-parse --abbrev-ref --symbolic-full-name @{u})"
abbr -a gspll "git submodule update --remote"
abbr -a gspsh "git push $GIT_MAIN_REMOTE --recurse-submodules=on-demand"
abbr -a gsqsm "git rebase --interactive --autosquash $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a gsrst "git submodule update --init --recursive --jobs 3"
abbr -a gst "git status -sb"
abbr -a gstp "git status --porcelain | awk '{\$1 = \"\"; print substr(\$0, 2)}'"
abbr -a gsw "git switch"
abbr -a gswm "git switch --detach $GIT_MAIN_REMOTE/$GIT_MAIN_LOCAL"
abbr -a gwa "git worktree add -b <branch> <dir> <branch_to_start_from>"
abbr -a gwip "git add . && git commit -m 'WIP' --no-verify"
abbr -a gwl "git worktree list"
abbr -a gwr "cd (git rev-parse --show-toplevel) && git worktree remove -f"
abbr -a gx "git mergetool"
abbr -a pll "git pull --all --recurse-submodules=yes "
abbr -a psh "git push -u $GIT_MAIN_REMOTE (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)"
abbr -a pshf "git push --force-with-lease $GIT_MAIN_REMOTE (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)"
abbr -a pshm "git push $GIT_MAIN_REMOTE HEAD:$GIT_MAIN_LOCAL"
abbr -a pshmf "git push --force-with-lease $GIT_MAIN_REMOTE HEAD:$GIT_MAIN_LOCAL"

# ABBREVIAZIONI NODE
abbr -a nrst "rm -rf node_modules package-lock.json"
abbr -a taptsrun "nvm use; NODE_ENV=test TZ=UTC npx tap --node-arg=--require=tsconfig-paths/register --100 --changed --timeout 60000 --jobs=1 --ts"
abbr -a taptsdbg "nvm use; NODE_ENV=test TZ=UTC npx tap --node-arg=--inspect-brk --node-arg=--require=tsconfig-paths/register --100 --changed --timeout 60000 --jobs=1 --ts"

# ABBREVIAZIONI FILES
abbr --add flnk "find . -type l -maxdepth 1"
abbr --add fopn "lsof | wc -l"

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied "sudo lsof -i -P"

# ALTRE ABBREVIAZIONI
abbr -a battery "pmset -g batt"
abbr -a cfg "cd $XDG_CONFIG_LINK"
abbr -a delenvs "rm $FISH_DIR/fish_variables"
abbr -a dot "cd $DOTFILES"
abbr -a esl "eslint --fix (git rev-parse --show-toplevel) | fpp"
abbr -a frst "rm $FISH_DIR/fish_variables"
abbr -a Erc "$EDITOR $RCFILE"
abbr -a Evini "$EDITOR $NVIM_DIR/init.lua"
abbr -a Eala "$EDITOR $ALACRITTY_DIR/alacritty.yml"
abbr -a Eprv "$EDITOR $PRIVATE_DOTFILES/privatefile"
abbr -a Essh "$EDITOR $HOME/.ssh/config"
abbr -a Eala "$EDITOR $ALACRITTY_DIR/alacritty.yml"
abbr -a Ewez "$EDITOR $WEZTERM_DIR/wezterm.lua"
abbr -a Ezj "$EDITOR $ZELLIJ_FILE"
abbr -a pgr "pgrep -fal"
abbr -a prv "cd $PRIVATE_S"
abbr -a repos "cd $DIR_REPOS"
abbr -a rl "rustlings"
abbr -a v "$EDITOR -u NONE -i NONE"
abbr -a vi "$EDITOR"
abbr -a vid "cd $NVIM_DIR"
abbr -a wed "cd $WEZTERM_DIR"
abbr -a zj "zellij"

# ONEPASSWORD retrieve
# op://<vault>/<item>[/<section>]/<field>
abbr -a pgpg "op read op://Personal/GPG_private/passphrase | pbcopy"
abbr -a wgpg git_root"op read op://treedom/GPG_treedom/passphrase | pbcopy"

bind \co openfile
fish_vi_key_bindings

#workaround for resolving push (hung on) issue
#set SSH_AUTH_SOCK ssh git@github.com

set -xg SSH_AUTH_SOCK $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

fish_ssh_agent
eval (ssh-agent -c) >/dev/null

op completion fish | source

alias gstdiff="git status --porcelain | sed 's/^...//' | while read f; git difftool --color=always --word-diff=color --word-diff-regex=. $argv $f; end;"

if status is-interactive && test -f $FISH_DIR/custom/git_fzf.fish
    source $FISH_DIR/custom/git_fzf.fish
    git_fzf_key_bindings
end

starship init fish | source
