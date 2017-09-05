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
set guifont=BitstreamVeraSansMono\ Nerd\ Font\ Mono:h14
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
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
let g:terminal_scrollback_buffer_size = 100000
"}}}
" OTHER {{{
source ~/.vimsessions
if !empty(glob("$DOTFILES/.config/nvim/nvim_plugins.vim"))
    source $DOTFILES/.config/nvim/nvim_plugins.vim
endif
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
" Show syntax highlighting groups for word under cursor
nnoremap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
" }}}
" KEYBINDINGS {{{
" GENERAL {{{
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
nnoremap <silent> <leader>[ :silent! call ResolveGitConflicts("backward")<CR>
nnoremap <silent> <leader>] :call ResolveGitConflicts("forward")<CR>

nnoremap <leader><TAB> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <leader><TAB> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
inoremap {} {}<left><CR><ESC>O
" Differences between nvim and vim
if has('nvim')
    tnoremap <leader>tc <C-\><C-n>:term<CR>i
    tnoremap <leader>tn <C-\><C-n>:bn<CR>hi
    tnoremap <leader>tp <C-\><C-n>:bp<CR>li
    tnoremap <leader>tw <C-\><C-n>:buffers<CR>i
    tnoremap <leader>t, <C-\><C-n>:file 
    tnoremap <leader>t% <C-\><C-n>:vnew<CR>:term<CR>i
    tnoremap <leader>t" <C-\><C-n>:new<CR>:term<CR>i
    tnoremap <leader>tl <C-\><C-n><C-W>li
    tnoremap <leader>th <C-\><C-n><C-W>hi
    tnoremap <leader>tk <C-\><C-n><C-W>ki
    tnoremap <leader>tj <C-\><C-n><C-W>ji
else
    set ttymouse=xterm2
endif
if has('nvim')
    autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
    autocmd BufEnter term://* startinsert
endif
augroup change_dir_to_root
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufEnter * silent! lcd `git rev-parse --show-toplevel`
augroup end
" }}}
" VIM {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim normal zR
    autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>j0
augroup END
" }}}
" HASKELL {{{
augroup filetype_haskell
    autocmd FileType haskell nnoremap <buffer> <localleader>c I-- <esc>j0
    autocmd FileType haskell vnoremap <buffer> <localleader>c <esc>'<O{-<esc>'>o-}<esc>j0
augroup END
" }}}
" ELIXIR {{{
augroup filetype_elizir
    autocmd FileType elixir nnoremap <buffer> <localleader>c I# <esc>0
    autocmd FileType elixir vnoremap <buffer> <localleader>c <esc>'<O"""<esc>'>o"""<esc>j0
augroup END
" }}}
" }}}
filetype plugin indent on
