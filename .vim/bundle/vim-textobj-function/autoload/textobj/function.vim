" textobj-function - Text objects for functions
" Version: 0.4.0
" Copyright (C) 2014 Kana Natsuno <http://whileimautomaton.net/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

function! s:select(object_type)
  return exists('b:textobj_function_select')
  \      ? b:textobj_function_select(a:object_type)
  \      : 0
endfunction

function! textobj#function#select_a()
  return s:select('a')
endfunction

function! textobj#function#select_i()
  return s:select('i')
endfunction

function! textobj#function#select_A()
  let oln = line('.')

  let r = s:select('a')
  if r is 0
    return r
  endif

  let [_, bp, ep] = r
  let bln = bp[1]
  let eln = ep[1]

  call cursor(bln, 1)
  let lln = search('\v(.\n\zs\n+.*%#)|(%^\n\n+.*%#)', 'bcW')
  let lp = getpos('.')

  call cursor(eln, 1)
  let tln = search('\v%#.*\n\n*\zs\n', 'cW')
  let tp = getpos('.')

  if lln != 0 && tln != 0
    if oln < bln
      return ['V', lp, ep]
    else
      return ['V', bp, tp]
    endif
  endif
  if lln != 0
    return ['V', lp, ep]
  endif
  if tln != 0
    return ['V', bp, tp]
  endif
  return r
endfunction

function! textobj#function#select_I()
  return s:select('a')
endfunction

" __END__  "{{{1
" vim: foldmethod=marker
