" core binds {{{

nnoremap gl G
vnoremap gl G
onoremap gl G
nnoremap <silent>- :noh<cr>
xnoremap <silent>- :noh<cr>
nnoremap <cr> :w<cr>

nnoremap g; g_
vnoremap g; g_
onoremap g; g_

nnoremap Q q
nnoremap q ZQ

nnoremap ( {
xnoremap ( {
nnoremap ) }
xnoremap ) }

xnoremap io iw
xnoremap ao aw
onoremap io iw
onoremap ao aw

omap ir i[
omap ar a[
xmap ir i[
xmap ar a[

omap ic i{
omap ac a{
xmap ic i{
xmap ac a{

nmap s <Leader>
omap s <Leader>
xmap s <Leader>

" emacs keybind standardization
nnoremap mk :bd<cr>

" }}}
" window operations {{{

nmap <leader>y <C-W>v
nmap <leader>x <C-W>s
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l

nmap <space>j <C-F>
nmap <space>k <C-B>

" }}}
" jungunn/vim-easy-align {{{

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" }}}
" fzf.vim {{{

nnoremap <leader>g :GitFiles<cr>
nnoremap <leader>i :Buffers<cr>
nnoremap <leader>. :Files<cr>
nnoremap gh :History<cr>

" FZF Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" FZF Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" }}}
" nin-scratch {{{

nnoremap gs :NinScratch<CR>

" }}}
" multiple-cursors {{{

nnoremap <silent> K :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> K :MultipleCursorsFind <C-R>/<CR>

" }}}
" BufExplorer {{{

nnoremap mi :BufExplorer<cr>

" }}}
" ranger.vim {{{

nnoremap <BS> :Ranger<cr>

" }}}

