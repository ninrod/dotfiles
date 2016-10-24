" plugins that require babysitting
source ~/.vim/theme-conf.vim
source ~/.vim/lightline-conf.vim
source ~/.vim/rainbow-conf.vim
source ~/.vim/vim-multiple-cursors-conf.vim

" core plugins, stock configuration
call LoadPlugin('bronson/vim-visual-star-search')
call LoadPlugin('chaoren/vim-wordmotion')
call LoadPlugin('ervandew/supertab')
call LoadPlugin('jiangmiao/auto-pairs')
call LoadPlugin('junegunn/vim-easy-align')
call LoadPlugin('tommcdo/vim-exchange')
call LoadPlugin('tpope/vim-commentary')
call LoadPlugin('tpope/vim-repeat')
call LoadPlugin('tpope/vim-surround')
call LoadPlugin('wellle/targets.vim')

" once in a lifetime used plugins
call LoadPlugin('edkolev/tmuxline.vim')
