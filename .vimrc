" Settings {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on
set nocompatible " Use vim, not vi api
set nobackup " No backup files
set nowritebackup " No write backup
set noswapfile " No swap file
set history=100 " Command history
set ruler " Always show cursor
set showcmd " Show incomplete commands

" search configurations
set incsearch " Incremental searching (search as you type)
set hlsearch " Highlight search matches
set ic " set smartcase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

set nowrap " Turn word wrap off

set backspace=indent,eol,start " Allow backspace to delete end of line, indent and start of line characters

set expandtab " Convert tabs to spaces
set tabstop=4 " Set tab size in spaces (this is for manual indenting)
set shiftwidth=4 " The number of spaces inserted for a tab (used for auto indenting)

set number " Turn on line numbers

set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100
set laststatus=2 " Always show status bar
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%) " Set the status line to something useful

set guioptions-=T " Hide the toolbar

set encoding=utf-8 " UTF encoding

set autoread " Autoload files that have changed outside of vim

set clipboard+=unnamed " Use system clipboard " http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals

set shortmess+=I " Don't show intro

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

set cursorline " Highlight the current line
set visualbell " Ensure Vim doesn't beep at you every time you make a mistype
set wildmenu " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set lazyredraw " redraw only when we need to (i.e. don't redraw when executing a macro)
set showmatch " highlight a matching [{()}] when cursor is placed on start/end character

" régua de limite horizontal
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=175
" }}}

" Plugins {{{
execute pathogen#infect()
filetype plugin indent on " required by Pathogen Plugin Manager

"Rust Racer autocomplete tool"
let g:racer_cmd ="/Users/ninrod/code/lib/rust/racer/target/release/racer"



" Syntastic options
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
" Theme
set background=dark
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_bold = 1
let g:solarized_underline= 0
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=16
else
    set guifont=Sauce\ Code\ Powerline:h14
endif
colorscheme solarized

"EasyMotion bindings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " type `l` and match `l`&`L`

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
let g:ctrlp_reuse_window = 'Scratch' " permitir que o ctrlp reuse a janela do Scratch
let g:ctrlp_arg_map = 1 " CtrlP -> override <C-o> to provide options for how to open files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store " CtrlP -> files matched are ignored when expanding wildcards
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " CtrlP -> use Ag for searching instead of VimScript. Might not work with ctrlp_show_hidden and ctrlp_custom_ignore.
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$' " CtrlP -> directories to ignore when fuzzy finding

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
let g:airline_powerline_fonts = 1

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" }}}

" Mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

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
vmap s <plug>(easymotion-s)

nnoremap - :Bufferlist<cr>
nnoremap <BS> :w<cr>
nnoremap + :Scratch<cr>
nnoremap & :noh<cr>

map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows
map <leader>v <C-W>v
map <leader>x <C-W>s
map <Leader>ww :ChooseWin<cr>

" Tabularize
" map <Leader>e :Tabularize /=<cr>
" map <Leader>c :Tabularize /:<cr>
" map <Leader>es :Tabularize /=\zs<cr>
" map <Leader>cs :Tabularize /:\zs<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

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

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}
