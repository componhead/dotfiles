# see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -xg XDG_CONFIG_HOME ~/.config
set -xg XDG_DATA_HOME ~/.local/share
set -xg XDG_DATA_DIRS /usr/local/share/:/usr/share/
set -xg XDG_CONFIG_DIRS /etc/xdg
set -xg XDG_CACHE_HOME ~/.cache
set -xg XDG_RUNTIME_DIR ~/.runtime

set -xg DOTFILES ~/dotfiles
set -xg RCFILE ~/.config/omf/init.fish
set -xg APPDATA $HOME
set -xg TERM screen-256color
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg LSCOLOR Gxfxcxdxbxegedabagacad
set -xg GREP_COLOR '3;33'
set -xg EDITOR nvim
set -xg FPP_EDITOR nvim
set -xg DOCKERFILES "$DOTFILES/dockerFiles/"
set -xg LANG en_US.UTF-8
set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -xg grepprg rg\ --vimgrep
switch (uname)
    case "Linux"
        switch (cat /etc/lsb-release | grep "DISTRIB_ID" | sed "s/^.*\=//g")
		case "Ubuntu"
			set -xg SPECIFIC_DOTFILES "$DOTFILES/ubu"
			set -xg PRIVATE_DOTFILES "$DOTFILES/private_dotfiles/ubu"
		case "Kali"
			set -xg SPECIFIC_DOTFILES "$DOTFILES/kal"
			set -xg PRIVATE_DOTFILES "$DOTFILES/private_dotfiles/kal"
        end
    case "Darwin"
        set -xg SPECIFIC_DOTFILES "$DOTFILES/mac"
        set -xg PRIVATE_DOTFILES "$DOTFILES/private_dotfiles/mac"
end

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
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g fish_vi_key_bindings yes
set -g fish_escape_delay_ms 300

source "$SPECIFIC_DOTFILES/specific-configuration.fish"

set -g fish_user_abbreviations
set -U abbrs_initialized
set -U fish_user_paths $fish_user_paths /usr/local/bin $HOME/.local/bin

# ABBREVIAZIONI GIT 
abbr --add gad git add .
abbr --add gcm git commit -m
abbr --add gdf git difftool --color=always --word-diff=color --word-diff-regex=. HEAD
abbr --add gfl git diff --name-only --diff-filter=
abbr --add glg git log --decorate --graph --all --oneline --color
abbr --add gmr git mergetool --no-ff --no-commit
abbr --add gpt git add -p
abbr --add grs git reset --mixed HEAD
abbr --add gst git status -sb \| fpp
abbr --add gsu git submodule update --remote
abbr --add gti git
abbr --add groot 'cd (git rev-parse --show-toplevel)'
abbr --add pll git pull origin
abbr --add psh git push origin

# ALTRE ABBREVIAZIONI
abbr --add trm nvim -c terminal
abbr --add Eomf nvim ~/.local/share/omf/themes/(cat ~/.config/omf/theme)/
abbr --add Erc nvim $RCFILE
abbr --add Eenv nvim $SPECIFIC_DOTFILES/specific-configuration.fish
abbr --add Einstall nvim $SPECIFIC_DOTFILES/install-shell.sh
abbr --add Evimrc nvim ~/.config/nvim/init.vim ~/.config/nvim/nvim_plugins.vim
abbr --add Eprivate nvim $PRIVATE_DOTFILES/privatefile
abbr --add ubuntu_version lsb_release -idrc
abbr --add pgr pgrep -fal
abbr --add vi nvim
abbr --add battery pmset -g batt
abbr --add mux tmuxinator

# ABBREVIAZIONI FILES
abbr --add fopn 'lsof | wc -l'
abbr --add flnk 'find . -type l -maxdepth 1'
abbr --add ff 'rg -uuu --files | rg' 

# ABBREVIAZIONI NETWORKING
abbr --add network_port_occupied 'sudo lsof -i -P'

bind \co openfile
fish_vi_key_bindings

source $PRIVATE_DOTFILES/privatefile
add-ssh-keys
