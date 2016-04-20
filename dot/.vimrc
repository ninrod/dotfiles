" vim options {{{

" UTF encoding

" nvim/vim differences
if has('nvim')
  " I sometimes accidentally place my thumb on the macbook trackpad
  set mouse=c
else
  set encoding=utf-8
endif

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" diff options. without this Gdiff was splitting horizontally on OSx.
set diffopt=filler,vertical

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" search configurations
" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" set smartcase
set ic

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window.
" If you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers and relative line numbers
set nu
set rnu


" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Hide the toolbar
set guioptions-=T

" Autoload files that have changed outside of vim
set autoread

" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
" Use system clipboard
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" indicates a wrap line continuation
set showbreak=←←

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" TODO verify the usefulness of this
set wildignore+=*/.hg/*,*/.svn/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*

" enable language-dependent indenting.
filetype plugin indent on

" }}}

" plugins {{{

call plug#begin('~/.vim/plugged')

" core
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
Plug 'bkad/CamelCaseMotion'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'nelstrom/vim-markdown-folding'
Plug 'nhooyr/neoman.vim'
Plug 'ninrod/ninscratch-vim'
Plug 'ninrod/vis'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" resource hog plugins
" Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
  \| Plug 'ninrod/vim-snippets'

Plug 'kana/vim-textobj-user'
  \| Plug 'kana/vim-textobj-entire',
  \| Plug 'kana/vim-textobj-function', {'for': 'javascript'}
  \| Plug 'thinca/vim-textobj-function-javascript', {'for': 'javascript'}
  \| Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'xml']}

Plug 'bronson/vim-visual-star-search'

call plug#end()

" }}}

" plugin configuration {{{

" bufexplorer configuration
let g:bufExplorerDisableDefaultKeyMapping=1

"lightline config
let g:lightline = {'colorscheme': 'solarized'}

"Ultisnips configuration
let g:UltiSnipsListSnippets = '<c-k>'

" vim-signature is eating a lot of our binds. lets fix this.
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "",
        \ 'GotoPrevSpotByPos'  :  "",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" auto-pairs plugin maps 'â' in insert mode limiting our ability to type 'â'. So we fix it.
let g:AutoPairsShortcutBackInsert=''

" Solarized Dark Theme
set background=dark
let g:solarized_bold=1
let g:solarized_underline=0
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_diffmode="high"
" let g:solarized_termcolors=16
silent! colorscheme solarized

" vim-commentary: disabling double backslash
let g:commentary_map_backslash=0

" fix contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn

" }}}

" custom binds {{{

" bufexplorer
nnoremap <BS> :ToggleBufExplorer<CR>

" nvim :terminal config
if has('nvim')
  ":terminal config
  tnoremap <c-n> <C-\><C-n>
endif

" more convenient access to the command prompt (shift sucks)
" based on tip from Damian Conway https://youtu.be/aHm36-na4-4?t=598
nnoremap ; :
xnoremap ; :

" `s` is equivalent to `cl`. As we lost `;`, we use `s` as our new `;` (shift sucks)
nnoremap s ;
xnoremap s ;

" same idea as above: better access to register stuff. We use more `"` than `'` and shift sucks.
nnoremap ' "
nnoremap " '
xnoremap ' "
xnoremap " '

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> <leader>iw <Plug>CamelCaseMotion_ie
xmap <silent> <leader>iw <Plug>CamelCaseMotion_ie

" :Gpush
nnoremap gp :Gpush<CR>

" trying out gl for `G` (shift sucks)
nnoremap gl G
vnoremap gl G
onoremap gl G

" easyalign mappings
xmap <cr> <Plug>(EasyAlign)

" scratch mappings
nnoremap gs :NinScratch<CR>

" bind to facilitate bracket selection
omap ir i[
omap ar a[
xmap ir i[
xmap ar a[

" space is my leader key, but '\' remains as leader.
nmap <Space> <Leader>
omap <Space> <Leader>
xmap <Space> <Leader>

" function keys
nnoremap <f5> :windo diffthis<cr>
nnoremap <f11> :so ~/.vimrc<cr>
nnoremap <f12> :e ~/.vimrc<cr>

" exits saving file
nnoremap Z ZZ

" exits without saving file
nnoremap Q ZQ

" enter saves file
nnoremap <cr> :w<cr>

" turn off search highlighting
nnoremap - :noh<cr>

" fugitive Gstatus command
nnoremap S :Gstatus<cr>

" my custom pageups and pagedowns
nmap <leader>d LztM
nmap <leader>u HzbM

" FZF bindings
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :History<cr>
nnoremap <leader>g :GitFiles<cr>

" FZF Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" FZF Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" resizing windows
nmap <leader><right> <C-W>10>
nmap <leader><left>  <C-W>10<
nmap <leader><up>    <C-W>10+
nmap <leader><down>  <C-W>10-

" equalizing windows
nmap <leader>= <C-W>=

" moving between windows
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l

" moving windows
nmap <leader>H <C-W>H
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>L <C-W>L

" open a vertical window
nmap <leader>v <C-W>v

" open a horizontal window
nmap <leader>x <C-W>s

" navigate vim help files
nnoremap  } <C-]>
nnoremap {  <C-T>

" omni completion alternative binding. see :h omnifunc
inoremap <C-p> <C-x><C-o>

" }}}

" auto commands {{{

" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
set foldlevelstart=0

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
autocmd Bufread,BufNewFile *.bowerrc set filetype=json

" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 conceallevel=0 fdm=expr
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=80


" disabling auto commenting on new line, e.g. 'o' and 'O'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enabling <cr> to work properly on the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" highlight cursor line line number
highlight CursorLineNr cterm=bold ctermfg=124

" quick bind for a 'wrap' command
command! -nargs=* Wrap set wrap linebreak nolist

" machit.vim extends % operator to work on html tags.
runtime macros/matchit.vim

" without this hack, % operator breaks on markdown file match navigation. e.g: '[' and '['.
" I suspect that other filetypes also need this.
autocmd BufReadPre,FileReadPre *.md,*.jsp MatchDebug

" fix for <CR> in command-line-window
silent! autocmd CmdwinEnter * nunmap <cr>
silent! autocmd CmdwinLeave * nnoremap <cr> :w<cr>

" }}}

" custom functions {{{

" credits go to junegunn who personally helped me with this function
function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens + ['--hidden']), 'v:val =~ "^-"'))
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))

  call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
endfunction

autocmd VimEnter * command! -nargs=* -bang Nag call s:ag_with_opts(<q-args>, <bang>0)

" }}}
