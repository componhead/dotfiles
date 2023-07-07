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
set -xg VIMRC $NVIM_DIR/init.lua
set -xg GIT_CONFIG_HOME $XDG_CONFIG_HOME/git
set -xg GIT_CONFIG_GLOBAL $GIT_CONFIG_HOME/config
set -xg RCFILE $FISH_DIR/config.fish
set -xg TMUXFILE $HOME/.tmux.conf
# ############# DON'T TOUCH ALL ABOVE

set -xg APPDATA $HOME
set -xg GIT_CURL_VERBOSE 0
set -xg GIT_TRACE 0
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg GREP_COLOR '3;33'
set -xg LESS -R
set -xg LESSCHARSET utf-8
set -xg grepprg "rg --vimgrep"
if type -q rg then
    set -xg FZF_FIND_FILE_COMMAND "rg --files --hidden --follow --glob '!.git'"
end
set -xg CPCLIPBOARD pbcopy
set -xg CPCLIPBOARD_CMD $CPCLIPBOARD -selection clipboard
set -xg TMUX_CLIPBOARD_COMMAND "reattach-to-user-namespace pbcopy"
set -xg LSCOLORS gxcxahdxacafxfaexeabxb
set -xg PYTHON /usr/local/bin/python3.9
set -xg NVIM_PYTHON_LOG_FILE /tmp/log
set -xg NVIM_PYTHON_LOG_LEVEL DEBUG
set -xg GPG_TTY (tty)

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
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
set -g theme_color_scheme solarized-light
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

alias git="$GIT_CONFIG_HOME/gitwrapper.sh"
#ABBREVIAZIONI GIT 
abbr -a -U -- g "git"
abbr -a -U -- gacm "git commit -am "
abbr -a -U -- gad "git add ."
abbr -a -U -- gcf "git config -e"
abbr -a -U -- gcfg "git config --global -e"
abbr -a -U -- gcln "git clone --recursive"
abbr -a -U -- gcm "git commit -m "
abbr -a -U -- gcma "git commit --amend --no-edit"
abbr -a -U -- gco "git checkout "
abbr -a -U -- gcom "git checkout master"
abbr -a -U -- gdf "git difftool"
abbr -a -U -- gds "git difftool --name-status "
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
abbr -a -U -- gst "git status -sb | fpp"
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
abbr -a -U -- Evrc "$EDITOR $NVIM_DIR/after/plugin/defaults.lua"
abbr -a -U -- Eala "$EDITOR $ALACRITTY_DIR/alacritty.yml"
abbr -a -U -- Eprv "$EDITOR $PRIVATE_DOTFILES/privatefile"
abbr -a -U -- Essh "$EDITOR $HOME/.ssh/config"
abbr -a -U -- Etmx "$EDITOR $TMUXFILE"
abbr -a -U -- pgr "pgrep -fal"
abbr -a -U -- prv "cd $PRIVATE_DOTFILES"
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
set SSH_AUTH_SOCK ssh git@github.com

fish_ssh_agent
eval (ssh-agent -c) >/dev/null
/usr/local/bin/starship init fish | source

op completion fish | source

alias gstdiff="git status --porcelain | sed 's/^...//' | while read f; git difftool --color=always --word-diff=color --word-diff-regex=. $argv $f; end;"

if status is-interactive && test -f $FISH_DIR/custom/git_fzf.fish
	source $FISH_DIR/custom/git_fzf.fish
	git_fzf_key_bindings
end

set --universal nvm_default_version v18.13.0
