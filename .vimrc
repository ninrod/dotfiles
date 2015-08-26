" Settings {{{

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

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

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

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" régua de limite horizontal
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=175
" }}}

" Plugins {{{
execute pathogen#infect()

" required by Pathogen Plugin Manager
filetype plugin indent on

runtime macros/matchit.vim

"Rust Racer autocomplete tool"
let g:racer_cmd ="/Users/ninrod/code/lib/rust/racer/target/release/racer"

" Syntastic options
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
" Theme
set background=dark
let g:solarized_bold = 1
let g:solarized_underline= 0
let g:solarized_visibility="high"
let g:solarized_contrast="high"

if !has("gui_running")
    let g:solarized_termcolors=16
else
    set guifont=Sauce\ Code\ Powerline:h12
endif

colorscheme solarized

"EasyMotion bindings
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1

" vim-commentary: desabilitando o double backslash
let g:commentary_map_backslash=0

" vim-signature bookmark plugin
let g:signaturemarkertexthldynamic = 1

" nerdtree configs
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP configurations
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=10

" permitir que o ctrlp reuse a janela do Scratch
let g:ctrlp_reuse_window = 'Scratch'

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

""' " CtrlP -> use Ag for searching instead of VimScript. Might not work with ctrlp_show_hidden and ctrlp_custom_ignore.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g'

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" Ag (the silver searcher)
let g:agprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
let g:airline_powerline_fonts = 1

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" }}}

" Mappings {{{

nmap <Space> <Leader>
vmap <Space> <Leader>
omap <Space> <Leader>

nnoremap <f2> :NERDTreeTabsToggle<cr>
nnoremap <f4> :BD<cr>
nnoremap <f8> :SyntasticToggleMode<cr>
nnoremap <f12> :e $MYVIMRC<cr>
nnoremap <f11> :so $MYVIMRC<cr>

nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>r :CtrlPMRU<cr>
inoremap <leader>c <C-x><C-o>

autocmd FileType javascript vnoremap <buffer>  <leader>= :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>= :call RangeHtmlBeautify()<cr>
autocmd FileType less,css vnoremap <buffer> <leader>= :call RangeCSSBeautify()<cr>

map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)
map <leader>t <plug>(easymotion-bd-t)
nmap s <Plug>(easymotion-s)
omap s <plug>(easymotion-s)

" o xmap é melhor que o vmap porque o vmap mapea tanto para o visual quanto para o select mode. o xmap é só para o modo visual.
xmap s <plug>(easymotion-s)

" remapeando por causa do camelcasemotion
nnoremap ,, ,
xnoremap ,, ,
onoremap ,, ,

nnoremap - :Bufferlist<cr>
nnoremap <cr> :w<cr>
nnoremap + :Scratch<cr>
nnoremap & :noh<cr>

map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows
map <leader>v <C-W>v
map <leader>x <C-W>s
map <Leader>ww :ChooseWin<cr>
nnoremap <BS> <C-W>w

" Tabularize
" map <Leader>e :Tabularize /=<cr>
" map <Leader>c :Tabularize /:<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" foldmethod configurations
autocmd BufRead * setlocal foldmethod=marker
set foldlevelstart=20
" autocmd BufRead * normal zM

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}
