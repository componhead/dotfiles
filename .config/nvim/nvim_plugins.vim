" INSTALLATION {{{
let g:plug_url_format = 'https://github.com/%s.git'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimfiler.vim'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'pippocode/vim-lucius'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-markdown', {'for':['md','markdown']}
Plug 'junegunn/goyo.vim', {'for':['txt','md','markdown']}
Plug 'junegunn/fzf'
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
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
" HASKELL
Plug 'parsonsmatt/intero-neovim'
Plug 'alx741/vim-hindent', { 'for': ['haskell','hs'] }
" ELIXIR
Plug 'kbrw/elixir.nvim'
Plug 'elixir-lang/vim-elixir'
Plug 'elixir-editors/vim-elixir'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
call plug#end()

"}}}
" PLUGINS PREFERENCES {{{

" ----- GENERAL ----- {{{
set statusline+=%#warningmsg#
set statusline+=%*
let g:bufferline_echo = 0
let g:session_autosave = 'no'
let g:signify_disable_by_default = 0
let g:signify_update_on_bufenter = 1
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:surround_33 = "```\r```"
let g:vimfiler_as_default_explorer = 1
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
vnoremap <silent> gcc :'<,'>Commentary<CR>
" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
" Haskell file settings ---------------------- {{{
augroup haskell_settings
    au FileType haskell silent! setlocal formatprg=hindent
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
au! BufNewFile *.post silent! 0r ~/.config/nvim/templates/blogpost.tpl
au! BufRead,BufNewFile *.md,*.markdown :Goyo
au! VimLeave * :Goyo!
au! BufWrite *.post call <SID>createNewBlogPost()
" }}}
" }}}

" ----- Shougo/denite.nvim ----- {{{
" The prefix key.
nnoremap [denite] <Nop>
nmap \ [denite]
nnoremap <silent> [denite]f :<C-u>DeniteProjectDir file_rec line<CR>
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
"}}}
"
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

" ----- netrw ----- {{{
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
" }}}

" ----- w0rp/ale ----- {{{
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

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

" ----- parsonsmatt/intero-neovim ----- {{{
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
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
