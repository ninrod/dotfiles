" Vim additional ftplugin: javascript/textobj-function
" Version: 0.2
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim


let b:textobj_function_select = function('textobj#function#javascript#select')


if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'unlet! b:textobj_function_select'


let &cpo = s:save_cpo
unlet s:save_cpo
