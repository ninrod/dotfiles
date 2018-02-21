" execute pathogen#infect('bundle/{}/{}')
execute pathogen#infect('~/.dotfiles/deps/vim/{}/{}')

" appearance
let g:tmuxline_powerline_separators = 0
let g:lightline = {'colorscheme': 'molokai'}

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0

set background=dark
if &term=~'linux'
  colorscheme default
else
  colorscheme gruvbox
endif

" for whitespaces at the end of the lines:    
highlight SpecialKey ctermfg=124 guifg=#af3a03

" rainbow configs
let g:rainbow_active = 1

" multiple cursors config
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" fzf installation
set rtp+=~/.fzf

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

let g:delimitMate_expand_cr = 1

