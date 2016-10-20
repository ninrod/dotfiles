" no need for pathogen, vimplug, etc. just use this tiny function
function LoadPlugin(plugin)
  let basepath=','.'~/.vim/plugged/'
  let &runtimepath.=basepath . a:plugin
endfunction

" rainbow configs
let g:rainbow_active = 1

" vim-multiple-cursors
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

let basepath=','.'~/.vim/plugged/'

" theme plugins
call LoadPlugin('morhetz/gruvbox')
call LoadPlugin('itchyny/lightline.vim')
" call LoadPlugin('edkolev/tmuxline.vim')

"core
call LoadPlugin('bronson/vim-visual-star-search')
call LoadPlugin('chaoren/vim-wordmotion')
call LoadPlugin('ervandew/supertab')
call LoadPlugin('jiangmiao/auto-pairs')
call LoadPlugin('junegunn/vim-easy-align')
call LoadPlugin('luochen1990/rainbow')
call LoadPlugin('ninrod/vim-multiple-cursors')
call LoadPlugin('tommcdo/vim-exchange')
call LoadPlugin('tpope/vim-commentary')
call LoadPlugin('tpope/vim-repeat')
call LoadPlugin('tpope/vim-surround')
call LoadPlugin('wellle/targets.vim')
