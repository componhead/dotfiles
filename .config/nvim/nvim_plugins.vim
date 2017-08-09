" INSTALLATION {{{
let g:plug_url_format = 'git@github.com:%s.git'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'Shougo/neomru.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Valloric/YouCompleteMe'
Plug 'pippocode/vim-lucius'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-grepper'
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-markdown', {'for':['md','markdown']}
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/goyo.vim', {'for':['txt','md','markdown']}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jamessan/vim-gnupg'
Plug 'blueyed/vim-diminactive'
Plug 'itchyny/calendar.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'chrisbra/unicode.vim'
Plug 'vim-airline/vim-airline'
Plug 'ekalinin/Dockerfile.vim'
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell','hs'] }
Plug 'kassio/neoterm'
Plug 'thinca/vim-visualstar'
Plug 'vim-syntastic/syntastic'
call plug#end()

"}}}
" PLUGINS PREFERENCES {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
let g:airline_theme='dark'
let g:bufferline_echo = 0
let g:session_autosave = 'no'
let g:SuperTabDefaultCompletionType = 'context'
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
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_scala_checkers = ['ensime', 'fsc','scalac']
let g:deoplete#enable_at_startup = 1

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
autocmd FocusGained * let @z=@+
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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -nargs=+ Tg :T git <args>

set grepprg=rg\ --vimgrep
"}}}
" PLUGINS KEYMAPS {{{
" The prefix key.
nnoremap [denite] <Nop>
nmap § [denite]
nmap ß [denite]
nnoremap <silent> [denite][denite] :<C-u>DeniteProjectDir file_rec line<CR>
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
nnoremap <leader>mm :BookmarkToggle<CR>
nnoremap <leader>ma :BookmarkAnnotate<CR>
nnoremap <leader>ms :BookmarkShowAll<CR>
nnoremap <leader>ml :BookmarkNext<CR>
nnoremap <leader>mh :BookmarkPrev<CR>
nnoremap <leader>mc :BookmarkClear<CR>
nnoremap <leader>mx :BookmarkClearAll<CR>
nnoremap <leader>mkk :BookmarkMoveUp<CR>
nnoremap <leader>mjj :BookmarkMoveDown<CR>
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
" }}}
" Scala file settings ---------------------- {{{
augroup ensime_settings
    au!
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
    set noshowmode
    set noshowcmd
    set scrolloff=999
endfunction
function! s:goyo_leave()
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
