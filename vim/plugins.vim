execute pathogen#infect('bundle/{}/{}')

" appearance
let g:tmuxline_powerline_separators = 0
let g:lightline = {'colorscheme': 'molokai'}

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0

set background=dark
colorscheme gruvbox

" for whitespaces at the end of the lines:    
highlight SpecialKey ctermfg=124 guifg=#af3a03

" rainbow configs
let g:rainbow_active = 1

" multiple cursors config
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
