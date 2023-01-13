#!/usr/local/bin/fish
set -xg DOTFILES $HOME/dotfiles
# see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -xg XDG_CONFIG_HOME ~/.config
set -xg XDG_DATA_HOME ~/.local/share
set -xg XDG_DATA_DIRS /usr/local/share/:/usr/share/
set -xg XDG_CONFIG_DIRS /etc/xdg
set -xg XDG_CACHE_HOME ~/.cache

set -xg GIT_CURL_VERBOSE 0
set -xg GIT_TRACE 0
set -xg RCFILE "$XDG_CONFIG_HOME/fish/config.fish"
set -xg APPDATA $HOME
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg GREP_COLOR '3;33'
set -xg EDITOR nvim
set -xg FPP_EDITOR nvim
set -xg DOCKERFILES "$DOTFILES/dockerFiles/"
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

set -xg PRIVATE_DOTFILES "$DOTFILES/private_dotfiles/"(hostname)

set -gx PATH $PATH $HOME/bin $DOTFILES/bin `npm bin`

alias git="$DOTFILES/.gitwrapper.sh"
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
set --universal nvm_default_version v16

source "$PRIVATE_DOTFILES/privatefile"

#ABBREVIAZIONI GIT 
abbr --add gad git add .
abbr --add gcm git commit -m 
abbr --add gdf git difftool --color=always --word-diff=color --word-diff-regex=. HEAD
abbr --add gfl git diff --name-only --diff-filter=
abbr --add glg git log --color --decorate --graph --all --oneline
abbr --add gll git log --color --decorate --graph \| less -r
abbr --add gm git checkout master
abbr --add gnsk git update-index --no-skip-worktree 
abbr --add groot 'cd (git rev-parse --show-toplevel)'
abbr --add grst git restore . --recurse-submodules 
abbr --add gsk git update-index --skip-worktree 
abbr --add gst git status -sb
abbr --add gstp git diff --name-status HEAD..HEAD^
abbr --add gti git
abbr --add gsu git submodule update --init --recursive --jobs 3
abbr --add gspll git submodule update --remote
abbr --add gspsh git push origin --recurse-submodules=on-demand
abbr --add gcln git clone --recursive 
abbr --add pll git pull origin --recurse-submodules
abbr --add psh 'git push -u origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)'
abbr --add pshf 'git push -f origin (git rev-parse --abbrev-ref HEAD):(git rev-parse --abbrev-ref HEAD)'

# ALTRE ABBREVIAZIONI
abbr --add dot cd ~/dotfiles/
abbr --add ij cd $DIR_INTELLIJ_SETTINGS
abbr --add repos cd $DIR_REPOS
#abbr --add trm lvim -c terminal
abbr --add Erc lvim $RCFILE
abbr --add Src source $RCFILE
abbr --add Evimrc lvim ~/.config/nvim/init.vim
abbr --add Svimrc source ~/.config/nvim/init.vim
abbr --add Eala lvim ~/.config/alacritty/alacritty.yml
abbr --add Sala source ~/.config/alacritty/alacritty.yml
abbr --add Eprivate lvim $PRIVATE_DOTFILES/privatefile
abbr --add Sprivate source $PRIVATE_DOTFILES/privatefile
abbr --add Essh lvim ~/.ssh/config
abbr --add pgr pgrep -fal
abbr --add vi nvim 
abbr --add v nvim -u NONE -i NONE 
abbr --add lv lvim
abbr --add gls git ls-files -v . \| grep \^S
abbr --add battery pmset -g batt
abbr --add ta tmux attach

# ABBREVIAZIONI FILES
abbr --add fopn 'lsof | wc -l'
abbr --add flnk 'find . -type l -maxdepth 1'

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied 'sudo lsof -i -P'

#thefuck --alias | source 

bind \co openfile
fish_vi_key_bindings

#workaround for resolving push (hung on) issue
set SSH_AUTH_SOCK ssh git@github.com

fish_ssh_agent
eval (ssh-agent -c) > /dev/null
/usr/local/bin/starship init fish | source

op completion fish | source
