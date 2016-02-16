" Copyright (C) 2016  Sethi, Anmol <anmol@aubble.com>
" Author: Sethi, Anmol <anmol@aubble.com>
" 
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

let s:man_tag_depth = 0
let s:man_sect_arg = ''
let s:man_find_arg = '-w'
let s:man_cmd = 'man 2>/dev/null'

try
  if !has('win32') && $OSTYPE !~? 'cygwin\|linux' && system('uname -s') =~? 'SunOS' && system('uname -r') =~? '^5'
    let s:man_sect_arg = '-s'
    let s:man_find_arg = '-l'
  endif
catch /E145:/
  " Ignore the error in restricted mode
endtry

function neoman#get_page(...) abort
  if a:0 > 3
    redraws! | echon "neoman: " | echohl ErrorMsg | echon "too many arguments" | echohl None
    return
  elseif a:0 == 1
    let [page, sect] = [expand('<cword>'), '']
    if empty(page)
      redraws! | echon "neoman: " | echohl ErrorMsg | echon "no identifier under cursor" | echohl None
      return
    endif
  elseif a:0 == 2
    let [page, sect] = [a:2, '']
  elseif a:0 == 3
    let [page, sect] = [a:3, a:2]
  endif

  let [page, sect] = s:parse_page_and_section(sect, page)
  let [ok, where] = s:find_page(sect, page)
  if !ok
    redraws! | echon "neoman: " | echohl ErrorMsg | echon "no manual entry for " . page | echohl None
    return
  endif

  if empty(sect)
    let sect = fnamemodify(system(where), ":t")
    if fnamemodify(sect, ":e") ==# "gz\n"
      let sect = fnamemodify(sect, ":r")
    endif
    let sect = substitute(sect, '^[a-zA-Z_:.0-9-]\+\.\(\w\+\).*', '\1', '')
  endif

  exec 'let s:man_tag_buf_'.s:man_tag_depth.' = '.bufnr('%')
  exec 'let s:man_tag_lin_'.s:man_tag_depth.' = '.line('.')
  exec 'let s:man_tag_col_'.s:man_tag_depth.' = '.col('.')
  let s:man_tag_depth = s:man_tag_depth + 1

  if g:neoman_current_window == a:1
    if &filetype !=# 'neoman'
      let thiswin = winnr()
      wincmd b
      if winnr() > 1
        exe "norm! " . thiswin . "<C-W>w"
        while 1
          if &filetype == 'neoman'
            break
          endif
          wincmd w
          if thiswin == winnr()
            break
          endif
        endwhile
      endif
    endif
  endif

  silent exec 'edit man://'.page.'('.sect.')'
  setlocal modifiable
  silent keepjumps norm! 1G"_dG
  let $MANWIDTH = winwidth(0)-1
  silent exec 'r!'.s:man_cmd.' '.s:cmd(sect, page).' | col -b'
  " Remove blank lines from top and bottom.
  while getline(1) =~ '^\s*$'
    silent keepjumps norm! gg"_dd
  endwhile
  while getline('$') =~ '^\s*$'
    silent keepjumps norm! G"_dd
  endwhile
  setlocal filetype=neoman
  return
endfunction

function neoman#pop_page() abort
  if s:man_tag_depth > 1
    let s:man_tag_depth = s:man_tag_depth - 1
    exec "let s:man_tag_buf=s:man_tag_buf_".s:man_tag_depth
    exec "let s:man_tag_lin=s:man_tag_lin_".s:man_tag_depth
    exec "let s:man_tag_col=s:man_tag_col_".s:man_tag_depth
    exec s:man_tag_buf."b"
    exec s:man_tag_lin
    exec "norm! ".s:man_tag_col."|"
    exec "unlet s:man_tag_buf_".s:man_tag_depth
    exec "unlet s:man_tag_lin_".s:man_tag_depth
    exec "unlet s:man_tag_col_".s:man_tag_depth
    unlet s:man_tag_buf s:man_tag_lin s:man_tag_col
  endif
endfunction

" Expects a string like 'access' or 'access(2)'.
function s:parse_page_and_section(sect, str) abort
  try
    let page = substitute(a:str, '\*\?\([a-zA-Z_:.0-9-]\+\).*', '\1', '')
    if page =~# '\.$'
      let page = strpart(page, 0, len(page)-1)
      return [page, a:sect]
    endif
    let sect = substitute(a:str, '\*\?[a-zA-Z_:.0-9-]\+(\([^()]*\)).*', '\1', '')
    if sect ==# page
      let sect = a:sect
    endif
  catch
    redraws! | echon "neoman: " | echohl ErrorMsg | echon "failed to parse ".a:str.'"' | echohl None
  endtry
  return [page, sect]
endfunction

function s:cmd(sect, page) abort
  if !empty(a:sect)
    return s:man_sect_arg.' '.a:sect.' '.a:page
  endif
  return a:page
endfunction

function s:find_page(sect, page) abort
  let where = system(s:man_cmd.' '.s:man_find_arg.' '.s:cmd(a:sect, a:page))
  if where !~ "^/"
    if matchstr(where, " [^ ]*$") !~ "^ /"
      return [0, '']
    endif
  endif
  return [1, where]
endfunction

function! neoman#Complete(ArgLead, CmdLine, CursorPos) abort
  let l:args = split(a:CmdLine)
  let l:len = len(l:args)
  if l:len == 1
    let l:page = ""
    let l:sect = ""
  elseif l:len == 2
    if empty(a:ArgLead)
      let l:page = ""
      let l:sect = l:args[1]
    else
      if a:ArgLead =~# '[^(]('
        let tmp = split(a:ArgLead, '(')
        let l:page = tmp[0]
        if len(tmp) == 1
          let l:sect = ""
        else
          let l:sect = substitute(tmp[1], ')', '', '')
        endif
      else
        let l:page = l:args[1]
        let l:sect = ""
      endif
    endif
  else
    let l:page = l:args[2]
    let l:sect = l:args[1]
  endif
  " TODO REPORT BUG WITH THIS CODE
  " let l:mandirs = split($MANPATH, ':')
  " let l:candidates = []
  " for d in l:mandirs
  "   let l:candidates += glob(d . "**/" . l:page . "*." . l:sect . '*', 0, 1)
  " endfor
  let l:mandirs_list = split(system(s:man_cmd.' '.s:man_find_arg), ':')
  let l:mandirs = join(l:mandirs_list, ',')
  let l:candidates = globpath(l:mandirs, "**/" . l:page . "*." . l:sect . '*', 0, 1)
  for i in range(len(l:candidates))
    let l:candidates[l:i] = substitute((fnamemodify(l:candidates[l:i], ":t")),
          \ '\(.*\)\.\(.*\)', '\1(\2)', "")
  endfor
  return l:candidates
endfunction
