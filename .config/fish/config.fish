#!/usr/local/bin/fish

set -xg DOTFILES $HOME/dotfiles
# see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_DATA_DIRS /usr/local/share/:/usr/share/
set -xg XDG_CONFIG_DIRS /etc/xdg
set -xg XDG_CACHE_HOME $HOME/cache

set -xg EDITOR nvim
set -xg GIT_EDITOR $EDITOR
set -xg FPP_EDITOR $EDITOR

set -xg XDG_CONFIG_LINK $DOTFILES/.config
set -xg NVM_DIR $XDG_DATA_HOME/nvm
set -xg VIMRC $XDG_CONFIG_HOME/nvim/init.lua
set -xg GIT_CURL_VERBOSE 0
set -xg GIT_TRACE 0
set -xg GIT_CONFIG_HOME $XDG_CONFIG_HOME/git
set -xg GIT_CONFIG_GLOBAL $GIT_CONFIG_HOME/config
set -xg RCFILE $XDG_CONFIG_HOME/fish/config.fish
set -xg APPDATA $HOME
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg GREP_COLOR '3;33'
set -xg LESSCHARSET utf-8
set -xg grepprg rg\ --vimgrep
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

set -gx PATH $PATH $HOME/bin $DOTFILES/bin `npm bin`


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
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git

source $PRIVATE_DOTFILES/privatefile

alias git="$GIT_CONFIG_HOME/gitwrapper.sh"
#ABBREVIAZIONI GIT 
abbr --add gad git add .
abbr --add gcf git config -e
abbr --add gcfg git config --global -e
abbr --add gcm git commit -m 
abbr --add gdf git difftool --color=always --word-diff=color --word-diff-regex=. HEAD
abbr --add gfl git diff --name-only --diff-filter=
abbr --add gig $GIT_EDITOR $GIT_CONFIG_HOME/ignore
abbr --add ginsk git update-index --no-skip-worktree 
abbr --add gisk git update-index --skip-worktree 
abbr --add glg git log --color --decorate --graph --all --oneline
abbr --add gll git log --color --decorate --graph \| less -r
abbr --add gls git ls-files -v . \| grep \^S
abbr --add gm git checkout master
abbr --add groot 'cd (git rev-parse --show-toplevel)'
abbr --add grst git restore . --recurse-submodules 
abbr --add gst git status -sb
abbr --add gstp git diff --name-status HEAD..HEAD^
abbr --add gti git
abbr --add gsrst git submodule update --init --recursive --jobs 3
abbr --add gspll git submodule update --remote
abbr --add gspsh git push origin --recurse-submodules=on-demand
abbr --add gcln git clone --recursive 
abbr --add pll git pull origin --recurse-submodules
abbr --add psh 'git push -u origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)'
abbr --add pshf 'git push -f origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)'

# ALTRE ABBREVIAZIONI
abbr --add cfg cd $XDG_CONFIG_LINK
abbr --add vid cd $XDG_CONFIG_LINK/nvim
abbr --add dot cd $DOTFILES
abbr --add ij cd $DIR_INTELLIJ_SETTINGS
abbr --add repos cd $DIR_REPOS
abbr --add Erc $EDITOR $RCFILE
abbr --add Evrc $EDITOR $VIMRC
abbr --add Evplug $EDITOR $XDG_CONFIG_LINK/nvim/lua/custom/plugins/
abbr --add Eala $EDITOR $XDG_CONFIG_LINK/alacritty/alacritty.yml
abbr --add Eprv $EDITOR $PRIVATE_DOTFILES/privatefile
abbr --add Essh $EDITOR $HOME/.ssh/config
abbr --add pgr pgrep -fal
abbr --add vi $EDITOR 
abbr --add v $EDITOR -u NONE -i NONE 
abbr --add battery pmset -g batt
abbr --add ta tmux attach

# ABBREVIAZIONI FILES
abbr --add fopn 'lsof | wc -l'
abbr --add flnk 'find . -type l -maxdepth 1'

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied 'sudo lsof -i -P'

bind \co openfile
fish_vi_key_bindings

#workaround for resolving push (hung on) issue
set SSH_AUTH_SOCK ssh git@github.com

fish_ssh_agent
eval (ssh-agent -c) > /dev/null
/usr/local/bin/starship init fish | source

op completion fish | source

alias gstdiff="git status --porcelain | sed 's/^...//' | while read f; git difftool --color=always --word-diff=color --word-diff-regex=. $argv $f; end;"
