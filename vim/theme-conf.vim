" no need for pathogen, vimplug, etc. just use this tiny function

" call LoadPlugin('morhetz/gruvbox')
call LoadPlugin('dracula/vim')

" less eye strain
set background=dark

" must be set before invoking colorscheme
" gruvbox inverted selection is too much information to me
" plus, the inverted select does not
" play nicely with vim-multiple-cursors
" let g:gruvbox_invert_selection=0

colorscheme dracula

" see https://github.com/neovim/neovim/issues/4946
" 124 = gruvbox red
" highlight SpecialKey ctermfg=124 guifg=#cc241d                            	

" fix contrast issue with solarized dark.
" https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn
