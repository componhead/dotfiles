" STANDARD CONFIGURATION ----- {{{
" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#scala')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
"call SpaceVim#layers#load('lang#c')
"call SpaceVim#layers#load('lang#go')
"call SpaceVim#layers#load('lang#perl')
"call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('shell')   
call SpaceVim#layers#load('tools#screensaver')
let g:spacevim_statusline_separator = 'curve'
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
let g:spacevim_windows_smartclose = ''
let g:spacevim_windows_leader = '<F5>'
let g:spacevim_denite_leader = '<F6>'
let g:spacevim_unite_leader = '<F7>'
let g:chromatica#enable_at_startup = 0
" }}}
" MYCUSTOMS ----- {{{
let g:spacevim_colorscheme = 'lucius'
let g:lucius_style="dark"
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_disabled_plugins=[
\ ['arakashic/chromatica.nvim'],
\ ]
let g:spacevim_custom_plugins = [
\ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
\ ['troydm/zoomwintab.vim']
\ ]
if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint') 
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint') 
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''
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
    if pipe ==# 0
        " Scelta del blocco local '<<<<<<<'
        vnoremap <silent> <leader>1 <ESC>'a"_dd'cV'd"_d
        " Scelta del blocco index '>>>>>>>'
        vnoremap <silent> <leader>2 <ESC>'d"_dd'aV'c"_d
    else
        " Scelta del blocco local '<<<<<<<'
        vnoremap <silent> <leader>1 <ESC>'a"_dd'bV'd"_d
        " Scelta del blocco tra '|||||||' e '======='
        vnoremap <silent> <leader>2 <ESC>'aV'b"_d'cV'd"_d
        " Scelta del blocco index '>>>>>>>'
        vnoremap <silent> <leader>3 <ESC>'d"_dd'aV'c"_d
    endif
endfunction
nnoremap <silent> <leader>sudo :w !sudo tee % > /dev/null<CR>
nnoremap <silent> <leader>lcd :lcd %:p:h<CR>
nnoremap <silent> [d :silent! call ResolveGitConflicts("backward")<CR>
nnoremap <silent> ]d :call ResolveGitConflicts("forward")<CR>
" }}}
