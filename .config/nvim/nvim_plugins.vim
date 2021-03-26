" PLUGINS {{{{{{
" INSTALLATION {{{
let g:plug_url_format = 'https://github.com/%s.git'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
"call deoplete#enable_logging('DEBUG', 'deoplete.log')
call plug#begin('~/.local/share/nvim/plugged')
Plug 'pippocode/vim-lucius'
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" HASKELL
Plug 'parsonsmatt/intero-neovim'
Plug 'alx741/vim-hindent', { 'for': ['haskell','hs'] }
" ELIXIR
Plug 'kbrw/elixir.nvim'
Plug 'elixir-lang/vim-elixir'
Plug 'elixir-editors/vim-elixir'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" TYPESCRIPT
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'
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
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" }}}

" ----- w0rp/ale ----- {{{
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1

" Open the loclist if there were errors
let g:ale_open_list = 1

" Only lint on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

nnoremap <leader>et :ALEToggle<CR>
nnoremap <leader>ef :ALEFix<CR>

let g:ale_linters = {}
let g:ale_linters.tex = []
" Note: you'll have to run 'stack build ghc-mod' once per project
let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']
" For stripe: use 'erubis' instead of 'erubylint'
let g:ale_linters.eruby = ['erubis']
" CSS warnings were mostly chunderous
let g:ale_linters.css = []

" Be sure to never install 'prettier' globally, or you will be running
" prettier on all JavaScript files everywhere.
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_rust_cargo_check_all_targets = 0

augroup aleMaps
    au FileType javascript let g:ale_fix_on_save = 1
    au FileType css let g:ale_fix_on_save = 1
augroup END

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

" ----- mhinz/vim-grepper ----- {{{
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
"}}}
"}}}
"}}}}}}
