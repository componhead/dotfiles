" GENERAL SETTINGS {{{
" SET {{{
set runtimepath^=$HOME/dein.vim/repos/github.com/Shougo/dein.vim
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set shortmess+=I
set noswapfile
set linebreak
set scrolloff=5
set nobackup
set nowritebackup
set sidescroll=5
set omnifunc=syntaxcomplete#Complete
set clipboard+=unnamedplus
set timeoutlen=500
set ignorecase
set smartcase
set guifont=SourceCodePro+Powerline+Awesome\ Regular:h14
set cursorline
set hidden
set wildmode=longest:full,full
set wildignore+=*/target/*
" size of a hard tabstop
set tabstop=8
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" always uses spaces instead of tab characters
set expandtab
set shiftround
set noshowmode
set ttimeout
set ttimeoutlen=100
set listchars=eol:$,tab:>>,trail:~,extends:>,precedes:<,nbsp:-
set diffopt+=vertical
set grepprg=rg\ --vimgrep
set nowrapscan
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif
" Disable syntax highlight in diff mode
if &diff
    syntax off
    set nohlsearch
    set nonu
else
    syntax on
    set hlsearch
    set numberwidth=5
    set relativenumber
    set number
endif
"}}}
" LET {{{
let g:yankring_clipboard_monitor=0
" Reindicizza i ctags al salvataggio del file
"autocmd BufWritePost * call system("ctags -R")
let mapleader = "\<Space>"
let maplocalleader = "\\"
let g:terminal_scrollback_buffer_size = 100000
"}}}
" OTHER {{{
" Better compatibility with vim
if ! exists(':tnoremap')
    set ttymouse=xterm2
else
    "au BufferNewFile * if &buftype == 'terminal' | :set relativenumber | :set number | endif
endif
source ~/.vimsessions
if !empty(glob("$DOTFILES/.config/nvim/nvim_plugins.vim"))
    source $DOTFILES/.config/nvim/nvim_plugins.vim
endif
silent! source $DOTFILES/scala_settings.vim
" }}}
" FUNCTIONS {{{
" Handle git conflicts characters
function! ResolveGitConflicts(direction)
    set nohlsearch
    delmarks a b c d
    let pipe = search('^[\|]\{7}','nw')
    if pipe ==# 0
        if a:direction ==# 'forward'
            exec "normal! /^[<]\\{7}\<CR>ma" . "/^[=]\\{7}\<CR>mc" . "/^[>]\\{7}\<CR>md" . "'aV'd"
        else
            exec "normal! ?^[<]\\{7}\<CR>ma" . "?^[=]\\{7}\<CR>mc" . "?^[>]\\{7}\<CR>md" . "'aV'd"
        endif
    else
        if a:direction ==# 'forward'
            exec "normal! /^[<]\\{7}\<CR>ma" . "/^[|]\\{7}\<CR>mb" ."/^[=]\\{7}\<CR>mc" . "/^[>]\\{7}\<CR>md" . "'aV'd"
        else
            exec "normal! ?^[<]\\{7}\<CR>ma" . "?^[|]\\{7}\<CR>mb" ."?^[=]\\{7}\<CR>mc" . "?^[>]\\{7}\<CR>md" . "'aV'd"
        endif
    endif
    " Scelta del blocco index '>>>>>>>'
    vnoremap <silent> <leader>. <ESC>'d"_dd'aV'c"_d
    if pipe ==# 0
        " Scelta del blocco local '<<<<<<<'
        vnoremap <silent> <leader>, <ESC>'a"_dd'cV'd"_d
    else
        " Scelta del blocco local '<<<<<<<'
        vnoremap <silent> <leader>, <ESC>'a"_dd'bV'd"_d
        " Scelta del blocco tra '|||||||' e '======='
        vnoremap <silent> <leader>/ <ESC>'aV'b"_d'cV'd"_d
    endif
endfunction
" Disable syntax highlight in diff mode
"Toggles whether or not the current window is automatically zoomed
nnoremap <C-W>z :call ToggleMaxWins()<CR>
function! ToggleMaxWins()
    if exists('g:windowMax')
        au! maxCurrWin
        wincmd =
        unlet g:windowMax
    else
        augroup maxCurrWin
            " au BufEnter * wincmd _ | wincmd |
            "
            " only max it vertically
            au! WinEnter * wincmd _
        augroup END
        do maxCurrWin WinEnter
        let g:windowMax=1
    endif
endfunction
"" Handle git conflicts characters
"function! ResolveGitConflicts(direction)
"    :set nohlsearch
"    let grt = search('^[>]\{7}','nw')
"    let pipe = search('^[\|]\{7}','nw')
"    if pipe ==# 0
"        if a:direction ==# 'forward'
"            /^[<]\{7}<CR>ma/^[=]\{7}<CR>mc/^[>]\{7}<CR>md'aV'd
"        else
"            ?^[<]\{7}<CR>ma/^[=]\{7}<CR>mc/^[>]\{7}<CR>md'aV'd
"        endif
"    else
"        if a:direction ==# 'forward'
"            execute "normal! /^[<]\{7}<CR>ma/^[\|]\{7}<CR>mb/^[=]\{7}<CR>mc/^[>]\{7}<CR>md'aV'd"
"        else
"            execute "normal! ?^[<]\{7}<CR>ma/^[\|]\{7}<CR>mb/^[=]\{7}<CR>mc/^[>]\{7}<CR>md'aV'd"
"        endif
"    endif
"    " Scelta del blocco local '<<<<<<<'
"    vnoremap <silent> <leader>, <ESC>'a"_dd'bV'd"_dd
"    " Scelta del blocco index '>>>>>>>'
"    vnoremap <silent> <leader>. <ESC>'d"_dd'aV'c"_d
"    if pipe ==# 0
"        " Scelta del blocco tra '|||||||' e '======='
"        vnoremap <silent> <leader>/ <ESC>'aV'b"_d'cV'd"_d
"    endif
"endfunction
" Show syntax highlighting groups for word under cursor
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
" }}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" KEYBINDINGS {{{
nnoremap <F5> :Autoformat<CR>
noremap <F1> <ESC>:exec "help ".expand("<cWORD>")<CR>
noremap <F4> <ESC>:!ctags -R .<CR>
nnoremap k gk
nnoremap j gj

" Permette l'ignorecase con i comandi '*' e '#' quando usati per la parola corrente
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap <silent> <leader>sudo :w !sudo tee % > /dev/null<CR>

" Posiziona la directory locale 'lcd' alla directory contenente il file aperto
nnoremap <silent> <leader>lcd :lcd %:p:h<CR>

" Ricerca del blocco di conflitto
nnoremap <silent> <leader>[ :call ResolveGitConflicts("backward")<CR>
nnoremap <silent> <leader>] :call ResolveGitConflicts("forward")<CR>

nnoremap <leader><TAB> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <leader><TAB> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
inoremap {} {}<left><CR><ESC>O
if has('nvim')
    tnoremap <C-A> <C-\><C-n>
    tnoremap <C-A>c <C-\><C-n>:term<CR>
    tnoremap <C-A>n <C-\><C-n>:bn<CR>h
    tnoremap <C-A>p <C-\><C-n>:bp<CR>l
    tnoremap <C-A>w <C-\><C-n>:buffers<CR>
    tnoremap <C-A>, <C-\><C-n>:file 
    tnoremap <C-A>% <C-\><C-n>:vnew<CR>:term<CR>
    tnoremap <leader>" <C-\><C-n>:new<CR>:term<CR>
    tnoremap <C-A>[ <C-\><C-n>
    tnoremap <C-W>l <C-\><C-n><C-W>li
    tnoremap <C-W>h <C-\><C-n><C-W>hi
    tnoremap <C-W>k <C-\><C-n><C-W>ki
    tnoremap <C-W>j <C-\><C-n><C-W>ji
endif
" }}}
" AUTOCOMMANDS {{{
if did_filetype()	" filetype already set..
    finish		    " ..don't do these checks
endif
if getline(1) =~ '^#!.{-}\<bash|zsh\>$'
    setfiletype='sh'
endif
"match errorMsg /\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.]\[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|\[0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|\\\\[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]\\{1,3\}\|\[0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5]\\ \[6-9]\|\2[6-9][0-9]|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}\\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.]\\(2[5][6-9]\|2[6-9][0-9]\|\[3-9][0-9][0-9]\)/

if has('nvim')
    autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
    autocmd BufEnter term://* startinsert
endif
autocmd BufEnter * silent! lcd %:p:h
" }}}
filetype plugin indent on
