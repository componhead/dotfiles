" vim: set ft:vim :
"
" SET {{{
set runtimepath^=$HOME/dein.vim/repos/github.com/Shougo/dein.vim,~/.vim,~/.vim/after,~/.fzf/
set packpath+=~/.vim
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
if $TMUX == ''
    set clipboard+=unnamed
endif
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
set nospell
set spelllang=it,en
set spellsuggest=7
let g:rg_command = '
            \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
            \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
            \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
set nowrapscan
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif
"}}}
" LET {{{
let g:yankring_clipboard_monitor=0
let mapleader = "\<Space>"
let maplocalleader = "\\"
let g:terminal_scrollback_buffer_size = 100000
"}}}
source ~/.vimsessions
" ----- netrw ----- {{{
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
" }}}
if &diff
    " DIFF {{{
    " Disable syntax highlight in diff mode
    call plug#begin('~/.local/share/nvim/plugged')
    Plug 'componhead/vim-lucius'
    call plug#end()
    colorscheme lucius
    let g:lucius_style="dark"
    let g:lucius_contrast="low"
    let g:lucius_contrast_bg="high"
    set background=dark
    highlight CursorLine ctermfg=Black ctermbg=White cterm=bold guifg=black guibg=white gui=bold
    " Ricerca del blocco di conflitto
    nnoremap <silent> <leader>1 :diffget 1<CR>
    nnoremap <silent> <leader>2 :diffget 2<CR>
    nnoremap <silent> <leader>3 :diffget 3<CR>
    "}}}
else
    " NODIFF {{{
    syntax on
    set hlsearch
    set numberwidth=5
    set relativenumber
    set number
    " PLUGINS {{{
    " INSTALLATION {{{
    let g:plug_url_format = 'https://github.com/%s.git'
    call plug#begin('~/.local/share/nvim/plugged')
    Plug 'pippocode/vim-lucius'
    Plug 'Shougo/vimproc.vim', {'build' : 'make'}
    Plug 'sbdchd/neoformat'
    Plug 'w0rp/ale'
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-characterize'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-markdown', {'for':['md','markdown']}
    Plug 'tpope/vim-dispatch'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'junegunn/goyo.vim', {'for':['.txt','md','markdown']}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-emoji'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'chrisbra/unicode.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'thinca/vim-visualstar'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'Raimondi/delimitMate'
    Plug 'Yggdroot/indentLine'
    Plug 'elzr/vim-json'
    call plug#end()

    "}}}
    " PLUGINS PREFERENCES {{{

    " ----- GENERAL ----- {{{
    set statusline+=%#warningmsg#
    set statusline+=%*
    let g:netrw_banner=0        " disable annoying banner
    let g:netrw_browse_split=4  " open in prior window
    let g:netrw_altv=1          " open splits to the right
    let g:netrw_liststyle=3     " tree view
    let g:bufferline_echo = 0
    let g:session_autosave = 'no'
    let g:signify_disable_by_default = 0
    let g:signify_update_on_bufenter = 1
    let g:surround_45 = "<% \r %>"
    let g:surround_61 = "<%= \r %>"
    let g:surround_33 = "```\r```"
    " Automatically start language servers.
    let g:LanguageClient_autoStart = 1

    " ----- JAVASCRIPT/TYPESCRIPT -----{{{
    let g:vim_json_syntax_conceal = 0
    "}}}
    " ----- JAVASCRIPT/TYPESCRIPT -----{{{
    "  " Required for operations modifying multiple buffers like rename.
    set hidden
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
                \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ 'python': ['/usr/local/bin/pyls'],
                \ }
    if executable('javascript-typescript-stdio')
        let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
        " Use LanguageServer for omnifunc completion
        autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
    else
        au! BufRead,BufNewFile *.js,*.ts :echom "javascript-typescript-stdio not installed!"
    endif
    " <leader>ld to go to definition
    autocmd FileType javascript nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
    " <leader>lh for type info under cursor
    autocmd FileType javascript nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
    " <leader>lr to rename variable under cursor
    autocmd FileType javascript nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
    " Put this outside of the plugin section
    " <leader>lf to fuzzy find the symbols in the current document
    autocmd FileType javascript nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
    "}}}
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
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)
    command! -nargs=+ Tg :T git <args>
    set grepprg=rg\ --vimgrep
    vnoremap <silent> gcc :'<,'>Commentary<CR>
    " Useful maps
    "}}}
    " HTML file settings {{{
    autocmd BufNewFile *.html,*.htm silent! 0r ~/.config/nvim/templates/%:e.tpl
    " }}}
    " BLOG post file settings {{{
    function! s:goyo_enter()
        set noshowmode
        set noshowcmd
        set scrolloff=999
        set spell
    endfunction
    function! s:goyo_leave()
        set showmode
        set showcmd
        set scrolloff=5
        set nospell
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
    au! BufNewFile *.post silent! 0r ~/.config/nvim/templates/blogpost.tpl
    au! BufRead,BufNewFile *.md,*.markdown :Goyo
    au! VimLeave * :Goyo!
    au! BufWrite *.post call <SID>createNewBlogPost()
    " }}}
    " }}}
    " ----- pippocode/lucius ----- {{{
    colorscheme lucius
    let g:lucius_style="dark"
    let g:lucius_contrast="low"
    let g:lucius_contrast_bg="normal"
    set background=dark
    " }}}
    " ----- AIRLINE ----- {{{
    let g:airline_section_y = 'BN: %{bufnr("%")}'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='lucius'
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_left_alt_sep = ''
    let g:airline_symbols = {}
    let g:airline_symbols.crypt = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.paste = ''
    let g:airline_symbols.spell = ''
    let g:airline_symbols.notexists = ''
    let g:airline_symbols.whitespace = ''
    let g:airline_right_alt_sep = ''
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    " }}}
    " ----- MattesGroeger/vim-bookmarks ----- {{{
    nnoremap <silent> <leader>mm :BookmarkToggle<CR>
    nnoremap <silent> <leader>ma :BookmarkAnnotate<CR>
    nnoremap <silent> <leader>ms :BookmarkShowAll<CR>
    nnoremap <silent> <leader>ml :BookmarkNext<CR>
    nnoremap <silent> <leader>mh :BookmarkPrev<CR>
    nnoremap <silent> <leader>mc :BookmarkClear<CR>
    nnoremap <silent> <leader>mx :BookmarkClearAll<CR>
    nnoremap <silent> <leader>mkk :BookmarkMoveUp<CR>
    nnoremap <silent> <leader>mjj :BookmarkMoveDown<CR>
    "}}}
    "}}}
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
        " Scelta del blocco index REMOTE '>>>>>>>'
        vnoremap <silent> <leader>3 <ESC>'d"_dd'aV'c"_d
        if pipe ==# 0
            " Scelta del blocco LOCAL '<<<<<<<'
            vnoremap <silent> <leader>1  <ESC>'a"_dd'cV'd"_d
        else
            " Scelta del blocco LOCAL '<<<<<<<'
            vnoremap <silent> <leader>1 <ESC>'a"_dd'bV'd"_d
            " Scelta del blocco BASE tra '|||||||' e '======='
            vnoremap <silent> <leader>2 <ESC>'aV'b"_d'cV'd"_d
        endif
    endfunction
    nnoremap <silent> [d :silent! call ResolveGitConflicts("backward")<CR>
    nnoremap <silent> ]d :call ResolveGitConflicts("forward")<CR>
    " Show syntax highlighting groups for word under cursor
    nnoremap <C-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
    " }}}
    " KEYBINDINGS {{{
    " GENERAL {{{
    nnoremap <F4> <ESC>:!ctags -R .<CR>
    nnoremap <F5> :Autoformat<CR>
    noremap <F6> <ESC>:exec "help ".expand("<cWORD>")<CR>
    nnoremap <S-DOWN> gj
    nnoremap <S-UP> gk
    inoremap <S-DOWN> <ESC>gji
    inoremap <S-UP> <ESC>gki
    vnoremap <S-DOWN> gj
    vnoremap <S-UP> gk
    " TERMINAL {{{
    tnoremap <C-A> <ESC><C-\><C-n>
    tnoremap <C-A>x <ESC><C-\><C-n>:bdelete!<CR>
    tnoremap <C-A>w <ESC><C-\><C-n>:buffers<CR>
    tnoremap <C-A>c <ESC><C-\><C-n>:enew<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>:setlocal noswapfile<CR><C-\><C-n>:ter<CR>i
    tnoremap <C-A>, <ESC><C-\><C-n>:file 
    tnoremap <C-L> <ESC><C-\><C-n>:redraw!<CR>i
    tnoremap <C-A>" <ESC><C-\><C-n>:new<CR><C-\><C-n>:ter<CR>i
    tnoremap <C-A>% <ESC><C-\><C-n>:vnew<CR><C-\><C-n>:ter<CR>i
    tnoremap <C-A>n <ESC><C-\><C-n>:bn<CR>i
    tnoremap <C-A>p <ESC><C-\><C-n>:bp<CR>i
    " }}}
    " Permette l'ignorecase con i comandi '*' e '#' quando usati per la parola corrente
    nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
    nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
    nnoremap <silent> <leader>sudo :w !sudo tee % > /dev/null<CR>
    " Con testo selezionato, il <tab> viene aggiundo a inizio di ogni riga
    " TODO
    " Posiziona la directory locale 'lcd' alla directory contenente il file aperto
    nnoremap <silent> <leader>lcd :lcd %:p:h<CR>
    " Salta da un tag nel template all'altro (tag: maiuscole tra pipes '|')
    nnoremap <leader><TAB> /\|[A-Z]\+\|<cr>c/\|/e<CR>
    nnoremap <leader><S-TAB> ?\|[A-Z]\+\|<cr>c/\|/e<CR>
    inoremap <leader><TAB> <ESC>/\|[A-Z]\+\|<cr>c/\|/e<CR>
    inoremap <leader><S-TAB> <ESC>?\|[A-Z]\+\|<cr>c/\|/e<CR>
    match Todo /|[A-Z]\+|/
    nnoremap <leader>tc <C-\><C-n>:term<CR>i
    nnoremap <leader>tn <C-\><C-n>:bn<CR>hi
    nnoremap <leader>tp <C-\><C-n>:bp<CR>li
    nnoremap <leader>tw <C-\><C-n>:buffers<CR>i
    nnoremap <leader>t, <C-\><C-n>:file 
    nnoremap <leader>t% <C-\><C-n>:vnew<CR>:term<CR>i
    nnoremap <leader>t" <C-\><C-n>:new<CR>:term<CR>i
    nnoremap <leader>tl <C-\><C-n><C-W>li
    nnoremap <leader>th <C-\><C-n><C-W>hi
    nnoremap <leader>tk <C-\><C-n><C-W>ki
    nnoremap <leader>tj <C-\><C-n><C-W>ji
    autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber number
    autocmd BufEnter term://* startinsert
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
    " JAVASCRIPT {{{
    augroup filetype_javascript
        autocmd!
        autocmd FileType javascript setlocal foldmethod=syntax
    augroup END
    " }}}
    " JSON {{{
    augroup filetype_json
        autocmd FileType json set autoindent 
        autocmd FileType json set formatoptions=tcq2l 
        autocmd FileType json set textwidth=78 shiftwidth=2 
        autocmd FileType json set softtabstop=2 tabstop=8 
        autocmd FileType json set expandtab 
        autocmd FileType json set foldmethod=syntax 
    augroup END
    " }}}
    " MARKDOWN {{{
    augroup filetype_markdown
        au! FileType markdown setlocal foldmethod=marker
        au! FileType markdown setlocal foldmarker=&nbsp;,&nbsp;
        au! FileType markdown normal zR
        au! FileType markdown nnoremap <buffer> <localleader>c I[//]: # ()<esc>hi
    augroup END
    " }}}
    " }}}
    filetype plugin indent on
    " }}}
endif
