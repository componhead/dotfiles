set -xg DOTFILES ~/dotfiles
set -xg PAGER less
set -xg TERM screen-256color
set -xg CLICOLOR 1
set -xg CLICOLOR_FORCE 1
set -xg LSCOLOR Gxfxcxdxbxegedabagacad
set -xg GREP_COLOR '3;33'
set -xg JEKYLL_GITHUB_TOKEN 'c5826f89fba802f901cb846fbaf5e3f3059e51af'
set -xg EDITOR nvim
set -xg DOCKERFILES "$DOTFILES/dockerFiles/"
set -xg LANG en_US.UTF-8
set -xg fish_user_paths /usr/local/bin $fish_user_paths
set -xg JBOSS_HOME /home/eanichini/repo/mfpro-tools/docker-jboss-esterno/buildfiles/jboss-4.2.3.GA
set -xg JBOSS_SERVER_CONFIG tserver
switch (uname)
    case "Linux"
        set -xg SPECIFIC_DOTFILES "$DOTFILES/lnx"
    case "Darwin"
        set -xg SPECIFIC_DOTFILES "$DOTFILES/mac"
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

source "$SPECIFIC_DOTFILES/specific-configuration.fish"

# ABBREVIAZIONI GIT 
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add g+ 'git add '
    abbr --add g- 'git checkout -- '
    abbr --add gau 'git update-index --assume-unchanged '
    abbr --add gcm 'git commit -m "'
    abbr --add gco 'git checkout '
    abbr --add gdf 'git difftool --color=always --word-diff=color --word-diff-regex=. HEAD'
    abbr --add gfl 'git diff --name-only --diff-filter='
    abbr --add gft 'git fetch origin '
    abbr --add glg 'git log --decorate --graph --all --oneline --color'
    abbr --add gmr 'git mergetool --color=always --no-ff --no-commit '
    abbr --add gnu 'git update-index --no-assume-unchanged '
    abbr --add gpl 'git pull origin '
    abbr --add gps 'git push origin '
    abbr --add gpt 'git add -p '
    abbr --add grb 'git rebase '
    abbr --add grs 'git reset --mixed HEAD'
    abbr --add gst 'git status -sb'
    abbr --add gti 'git'
end
