" Description: Keymaps

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"------------------------------
" Terminal
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

