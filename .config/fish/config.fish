# TO FIX fzf_key_bindings
# ln -sf ~/.fzf/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish
set -xg DOTFILES ~/dotfiles
# see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -xg XDG_CONFIG_HOME "$DOTFILES/.config"
set -xg XDG_DATA_HOME ~/.local/share
set -xg XDG_DATA_DIRS /usr/local/share/:/usr/share/
set -xg XDG_CONFIG_DIRS /etc/xdg
set -xg XDG_CACHE_HOME ~/.cache
set -xg XDG_RUNTIME_DIR ~/.runtime

set -xg OMF_PATH "$XDG_DATA_HOME/omf"
set -xg RCFILE "$XDG_CONFIG_HOME/fish/config.fish"
set -xg APPDATA $HOME
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg GREP_COLOR '3;33'
set -xg EDITOR nvim
set -xg FPP_EDITOR nvim
set -xg DOCKERFILES "$DOTFILES/dockerFiles/"
set -xg FZF_HOME ~/.fzf
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -xg FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
set -xg LESSCHARSET utf-8
set -xg grepprg rg\ --vimgrep
switch (uname)
    case "Linux"
      set -xg SPECIFIC_DOTFILES "$DOTFILES/lnx"
    case "Darwin"
      set -xg SPECIFIC_DOTFILES "$DOTFILES/mac"
end
set -xg PRIVATE_DOTFILES "$DOTFILES/private_dotfiles/"(hostname)

set -gx PATH $PATH $DOTFILES/bin `npm bin`

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
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_color_scheme solarized-dark
set -g theme_newline_cursor yes
set -g fish_vi_key_bindings yes
set -g fish_escape_delay_ms 300
set -g fish_user_abbreviations
set -U abbrs_initialized
set -U fish_user_paths /usr/local/bin $HOME/.local/bin $FZF_HOME/bin

source "$SPECIFIC_DOTFILES/specific-configuration.fish"
source "$PRIVATE_DOTFILES/privatefile"

# ABBREVIAZIONI GIT 
abbr --add gad git add .
abbr --add gas git update-index --assume-unchanged 
abbr --add gac git update-index --no-assume-unchanged 
abbr --add gbl git branch --list
abbr --add gbr git branch
abbr --add gcd git checkout develop
abbr --add gcf git checkout feature/
abbr --add gcm gitmoji -c
abbr --add gdf git difftool --color=always --word-diff=color --word-diff-regex=. HEAD
abbr --add gfl git diff --name-only --diff-filter=
# Git Flow
abbr --add gffs git flow feature start
abbr --add gffp git flow feature publish
abbr --add gfff git flow feature finish
#
abbr --add gg git status -sb \| fpp
abbr --add glg git log --color --decorate --graph --all --oneline \| emojify \| less -r
abbr --add gmg git merge --no-commit --no-ff
abbr --add gmt git mergetool
abbr --add gpt git add -p
abbr --add grs git reset --mixed HEAD
abbr --add gst git status -sb \| fpp
abbr --add gsu git submodule update --remote
abbr --add gti git
abbr --add groot 'cd (git rev-parse --show-toplevel)'
abbr --add pll git pull origin
abbr --add psh git push origin

# ALTRE ABBREVIAZIONI
abbr --add dot cd ~/dotfiles/
abbr --add trm nvim -c terminal
abbr --add Erc nvim $RCFILE
abbr --add Eenv nvim $SPECIFIC_DOTFILES/specific-configuration.fish
abbr --add Einstall nvim $SPECIFIC_DOTFILES/install-shell.sh
abbr --add Evimrc nvim $DOTFILES/.config/nvim/init.vim $DOTFILES/.config/nvim/nvim_plugins.vim
abbr --add Eprivate nvim $PRIVATE_DOTFILES/privatefile
abbr --add pgr pgrep -fal
abbr --add vi nvim 
abbr --add battery pmset -g batt
abbr --add mux tmuxinator
abbr --add fuz fzf -m | while read -l r; set result $result $r; end; and vim $result

# ABBREVIAZIONI FILES
abbr --add fopn 'lsof | wc -l'
abbr --add flnk 'find . -type l -maxdepth 1'

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied 'sudo lsof -i -P'

bind \co openfile
fish_vi_key_bindings
##tmux -2
