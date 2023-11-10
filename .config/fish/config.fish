#!/usr/local/bin/fish

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

set -xg NVIM_DIR $XDG_CONFIG_HOME/nvim
set -xg FISH_DIR $XDG_CONFIG_HOME/fish
set -xg TMUX_DIR $HOME/.tmux
set -xg ALACRITTY_DIR $XDG_CONFIG_HOME/alacritty
set -xg ZELLIJ_DIR $XDG_CONFIG_HOME/zellij
set -xg VIMRC $NVIM_DIR/init.lua
set -xg GIT_CONFIG_HOME $XDG_CONFIG_HOME/git
set -xg GIT_CONFIG_GLOBAL $GIT_CONFIG_HOME/config
set -xg RCFILE $FISH_DIR/config.fish
set -xg TMUXFILE $HOME/.tmux.conf
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
set -g theme_color_scheme solarized-dark
set -g theme_newline_cursor yes
set -g fish_vi_key_bindings yes
set -g fish_escape_delay_ms 300
set -g fish_user_abbreviations
set -U abbrs_initialized
set -U fish_user_paths /usr/local/bin $HOME/.local/bin
set -gx fish_tmux_config $TMUXFILE
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git

source $PRIVATE_DOTFILES/privatefile

# ABBREVIAZIONI DOCKER
abbr -a -U -- dci "docker container info"
abbr -a -U -- dcn "docker container"
abbr -a -U -- dcs "docker container start"
abbr -a -U -- dcS "docker container stop"
abbr -a -U -- dil "docker images -a"
abbr -a -U -- dit "docker container exec -it"
abbr -a -U -- dim "docker image"
abbr -a -U -- dlg "docker container logs"
abbr -a -U -- dls "docker container ps -a"
abbr -a -U -- dpt "docker container port"

alias git="$GIT_CONFIG_HOME/gitwrapper.sh"
# ABBREVIAZIONI GIT 
abbr -a -U -- g "git"
abbr -a -U -- gacm "git commit -am"
abbr -a -U -- gad "git add ."
abbr -a -U -- gcf "git config -e"
abbr -a -U -- gcfg "git config --global -e"
abbr -a -U -- gcln "git clone --recursive"
abbr -a -U -- gcm "git commit -m"
abbr -a -U -- gcma "git commit --amend"
abbr -a -U -- gcmx "git commit --amend --no-edit --no-verify"
abbr -a -U -- gco "git checkout -b"
abbr -a -U -- gdf "git difftool"
abbr -a -U -- gds "git difftool --name-status"
abbr -a -U -- gf "git fetch --all --recurse-submodules=yes"
abbr -a -U -- gig "$GIT_EDITOR $GIT_CONFIG_HOME/ignore"
abbr -a -U -- ginsk "git update-index --no-skip-worktree"
abbr -a -U -- gisk "git update-index --skip-worktree"
abbr -a -U -- gl "git log --color --decorate --graph --all --oneline"
abbr -a -U -- gls "git ls-files -v . | grep \^S"
abbr -a -U -- grest "git restore . --recurse-submodules"
abbr -a -U -- groot "cd (git rev-parse --show-toplevel)"
abbr -a -U -- grst "git reset --hard (git rev-parse --abbrev-ref --symbolic-full-name @{u})"
abbr -a -U -- gspll "git submodule update --remote"
abbr -a -U -- gspsh "git push origin --recurse-submodules=on-demand"
abbr -a -U -- gsrst "git submodule update --init --recursive --jobs 3"
abbr -a -U -- gst "git status -sb"
abbr -a -U -- gsw "git switch"
abbr -a -U -- gswm "git switch --detach origin/master"
abbr -a -U -- pll "git pull --all --recurse-submodules=yes "
abbr -a -U -- psh "git push -u origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)"
abbr -a -U -- pshf "git push -f origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)"
abbr -a -U -- s "git status -sb"

# ABBREVIAZIONI NODE
abbr -a -U -- nrst "rm -rf node_modules package-lock.json"

# ABBREVIAZIONI FILES
abbr --add flnk "find . -type l -maxdepth 1"
abbr --add fopn "lsof | wc -l"

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied "sudo lsof -i -P"

# ALTRE ABBREVIAZIONI
abbr -a -U -- battery "pmset -g batt"
abbr -a -U -- cfg "cd $XDG_CONFIG_LINK"
abbr -a -U -- delenvs "rm $FISH_DIR/fish_variables"
abbr -a -U -- dot "cd $DOTFILES"
abbr -a -U -- esl "eslint --fix (git rev-parse --show-toplevel) | fpp"
abbr -a -U -- frst "rm $FISH_DIR/fish_variables"
abbr -a -U -- Erc "$EDITOR $RCFILE"
abbr -a -U -- Evini "$EDITOR $NVIM_DIR/init.lua"
abbr -a -U -- Evdef "$EDITOR $NVIM_DIR/after/plugin/defaults.lua"
abbr -a -U -- Eala "$EDITOR $ALACRITTY_DIR/alacritty.yml"
abbr -a -U -- Eprv "$EDITOR $PRIVATE_DOTFILES/privatefile"
abbr -a -U -- Essh "$EDITOR $HOME/.ssh/config"
abbr -a -U -- Etmx "$EDITOR $TMUXFILE"
abbr -a -U -- Ezj "$EDITOR $ZELLIJ_DIR/config.kdl"
abbr -a -U -- pgr "pgrep -fal"
abbr -a -U -- prv "cd $PRIVATE_S"
abbr -a -U -- repos "cd $DIR_REPOS"
abbr -a -U -- rl "rustlings"
abbr -a -U -- v "$EDITOR -u NONE -i NONE"
abbr -a -U -- vi "$EDITOR"
abbr -a -U -- vid "cd $NVIM_DIR"
abbr -a -U -- ta "tmux attach"
abbr -a -U -- tapd "NODE_ENV=test tap --node-arg=--inspect-brk --no-timeout --jobs=1 (git rev-parse --show-toplevel)"

# ONEPASSWORD retrieve
# op://<vault>/<item>[/<section>]/<field>
abbr -a -U -- pgpg "op read op://Personal/GPG_private/passphrase | pbcopy"
abbr -a -U -- wgpg "op read op://treedom/GPG_treedom/passphrase | pbcopy"

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

set --universal nvm_default_version v18.13.0

starship init fish | source
