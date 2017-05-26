" INSTALLATION {{{
" ------------- VERY IMPORTANT: Installation of vimproc ------------
" git clone https://github.com/Shougo/vimproc.vim.git ~/bin
" cd ~/bin/vimproc.vim
" make
" cp -r autoload ~/.config/nvim
" cp -r plugin ~/.config/nvim
" cp -r lib ~/.config/nvim
" cp ~/bin/vimproc.vim/lib/vimproc_mac.so ~/.cache/dein.vim/.dein/lib
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/bin/dein.vim
" -----------------------------------------
call dein#begin(expand('~/.cache/dein.vim'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('pippocode/vim-lucius')
call dein#add('jeetsukumaran/vim-buffergator')
call dein#add('jpalardy/vim-slime')
call dein#add('mhinz/vim-signify')
call dein#add('mhinz/vim-grepper')
call dein#add('derekwyatt/vim-scala')
call dein#add('tpope/vim-characterize')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-obsession')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-markdown', {'for':['md','markdown']})
call dein#add('Chiel92/vim-autoformat')
call dein#add('ervandew/supertab')
call dein#add('mbbill/undotree')
call dein#add('guns/xterm-color-table.vim')
call dein#add('junegunn/goyo.vim', {'for':['txt','md','markdown']})
call dein#add ('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('junegunn/fzf.vim')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('jamessan/vim-gnupg')
call dein#add('blueyed/vim-diminactive')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('neomake/neomake')
call dein#add('itchyny/calendar.vim')
call dein#add('MattesGroeger/vim-bookmarks')
call dein#add('chrisbra/unicode.vim.git')
call dein#add('bling/vim-airline')
call dein#add('rhysd/nyaovim-markdown-preview.git')
call dein#add('ekalinin/Dockerfile.vim.git')
call dein#add('neovimhaskell/haskell-vim', { 'for': ['haskell','hs'] })
call dein#add('eagletmt/ghcmod-vim', { 'for': ['haskell', 'hs'] })
call dein#add('eagletmt/neco-ghc', { 'for': ['haskell', 'hs'] })
call dein#add('Twinside/vim-hoogle', { 'for': ['haskell', 'hs'] })
call dein#add('mpickering/hlint-refactor-vim', { 'for': ['haskell', 'hs'] })
call dein#end()

if dein#check_install()
    call dein#install()
endif
"}}}
" PLUGINS PREFERENCES {{{
set statusline+=%#warningmsg#
set statusline+=%*
set rtp+=~/.fzf
colorscheme lucius
let g:lucius_style="dark"
let g:lucius_contrast="low"
let g:lucius_contrast_bg="normal"
set background=dark
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:surround_33 = "```\r```"
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
"let g:airline_theme='oceanicnext'
let g:airline_theme='dark'
let g:bufferline_echo = 0
let g:buffergator_viewport_split_policy = 'R'
let g:session_autosave = 'no'
let g:slime_target = "tmux"
let g:SuperTabDefaultCompletionType = 'context'
let g:unite_source_history_yank_enable = 1
let g:deoplete#enable_at_startup = 1
let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -- %f', 'accurev':  'accurev diff %f -- -U0' }
let g:signify_disable_by_default = 0
let g:signify_update_on_bufenter = 1
let g:formatdef_scalafmt = "'scalafmt'"
let g:formatters_scala = ['scalafmt']
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_first_day = "monday"
let g:calendar_time_zone = "+02:00"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" let g:unite_ignore_source_files = ['function.vim', 'command.vim']
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:markdown_preview_auto=1
let g:markdown_preview_eager=1
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
autocmd FocusGained * let @z=@+
autocmd! BufWritePost * Neomake
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)<Paste>
set grepprg=rg\ --vimgrep
"}}}
" PLUGINS KEYMAPS {{{
" The prefix key.
nnoremap [unite] <Nop>
nmap § [unite]
nmap ß [unite]
nnoremap <silent> [unite]p  :<C-u>UniteWithProjectDir -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
" nnoremap <silent> [unite]§  :<C-u>Unite -start-insert -buffer-name=buffer -no-split jump_point file_point buffer_tab file_rec/neovim file file/new<CR>
nnoremap <leader>mm :BookmarkToggle<CR>
nnoremap <leader>ma :BookmarkAnnotate<CR>
nnoremap <leader>ms :BookmarkShowAll<CR>
nnoremap <leader>ml :BookmarkNext<CR>
nnoremap <leader>mh :BookmarkPrev<CR>
nnoremap <leader>mc :BookmarkClear<CR>
nnoremap <leader>mx :BookmarkClearAll<CR>
nnoremap <leader>mkk :BookmarkMoveUp<CR>
nnoremap <leader>mjj :BookmarkMoveDown<CR>
" }}}
" Scala file settings ---------------------- {{{
augroup ensime_settings
    au BufWritePost *.scala :EnTypeCheck<CR>:Autoformat<CR>:EnOrganizeImports<CR>
    au FileType scala nnoremap <localleader>t :EnType<CR>
    au FileType scala nnoremap <localleader>d :EnDeclaration<CR>
    au FileType scala nnoremap <localleader>h :h ensime<CR>
    au FileType scala nnoremap <localleader>ws :WorksheetStart<CR>
    au FileType scala nnoremap <localleader>ww :WorksheetEval<CR>
    au FileType scala nnoremap <localleader>wc :WorksheetClean<CR>
    au FileType scala nnoremap <localleader>we :WorksheetEnd<CR>
augroup END
"}}}
" HTML file settings {{{
autocmd BufNewFile *.html,*.htm silent! 0r ~/.config/nvim/templates/%:e.tpl
" }}}
" BLOG post file settings {{{
function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction
function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let postDirectory = ""
function! s:createNewBlogPost() range
    let postDir = "_posts/"
    let l:originalfilename = expand('%')
    let l:filename = escape( strftime("%Y-%m-%d-") . expand('%<') . ".markdown", ' ' )
    if !empty(glob(postDir))
        execute "saveas " . postDir . l:filename
    else
        execute "saveas " . l:filename
    endif
endfunction
autocmd BufNewFile *.post silent! 0r ~/.config/nvim/templates/blogpost.tpl
autocmd BufRead *.post,*.md,*.markdown :Goyo
autocmd BufNewFile *.post,*.md,*.markdown :Goyo
autocmd VimLeave * :Goyo!
autocmd BufWrite *.post call <SID>createNewBlogPost()
" }}}
