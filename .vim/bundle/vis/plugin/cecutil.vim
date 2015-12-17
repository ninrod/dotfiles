 let s:modifier= "sil! keepj "
if &cp || exists("g:loaded_cecutil")
  finish
endif
let g:loaded_cecutil = "v18h"
let s:keepcpo        = &cpo
set cpo&vim

fun! SaveWinPosn(...)
  if line("$") == 1 && getline(1) == ""
    return ""
  endif
  let so_keep   = &l:so
  let siso_keep = &siso
  let ss_keep   = &l:ss
  setlocal so=0 siso=0 ss=0

  let swline = line(".")                           " save-window line in file
  let swcol  = col(".")                            " save-window column in file
  if swcol >= col("$")
    let swcol= swcol + virtcol(".") - virtcol("$")  " adjust for virtual edit (cursor past end-of-line)
  endif
  let swwline   = winline() - 1                    " save-window window line
  let swwcol    = virtcol(".") - wincol()          " save-window window column
  let savedposn = ""

  let savedposn = "call GoWinbufnr(".winbufnr(0).")"
  let savedposn = savedposn."|".s:modifier.swline
  let savedposn = savedposn."|".s:modifier."norm! 0z\<cr>"
  if swwline > 0
    let savedposn= savedposn.":".s:modifier."call s:WinLineRestore(".(swwline+1).")\<cr>"
  endif
  if swwcol > 0
    let savedposn= savedposn.":".s:modifier."norm! 0".swwcol."zl\<cr>"
  endif
  let savedposn = savedposn.":".s:modifier."call cursor(".swline.",".swcol.")\<cr>"

  if a:0 == 0
    if !exists("b:cecutil_iwinposn")
      let b:cecutil_iwinposn= 1
    else
      let b:cecutil_iwinposn= b:cecutil_iwinposn + 1
    endif
    let b:cecutil_winposn{b:cecutil_iwinposn}= savedposn
  endif

  let &l:so = so_keep
  let &siso = siso_keep
  let &l:ss = ss_keep

  return savedposn
endfun

fun! RestoreWinPosn(...)
  if line("$") == 1 && getline(1) == ""
    return ""
  endif
  let so_keep   = &l:so
  let siso_keep = &l:siso
  let ss_keep   = &l:ss
  setlocal so=0 siso=0 ss=0

  if a:0 == 0 || a:1 == ""
    if exists("b:cecutil_iwinposn") && exists("b:cecutil_winposn{b:cecutil_iwinposn}")
      try
        exe s:modifier.b:cecutil_winposn{b:cecutil_iwinposn}
      catch /^Vim\%((\a\+)\)\=:E749/
      endtry
      if b:cecutil_iwinposn >= 1
        unlet b:cecutil_winposn{b:cecutil_iwinposn}
        let b:cecutil_iwinposn= b:cecutil_iwinposn - 1
        while b:cecutil_iwinposn >= 1 && !exists("b:cecutil_winposn{b:cecutil_iwinposn}")
          let b:cecutil_iwinposn= b:cecutil_iwinposn - 1
        endwhile
        if b:cecutil_iwinposn < 1
          unlet b:cecutil_iwinposn
        endif
      endif
    else
      echohl WarningMsg
      echomsg "***warning*** need to SaveWinPosn first!"
      echohl None
    endif

  else	 " handle input argument
    exe a:1
    if exists("b:cecutil_iwinposn")
      let jwinposn= b:cecutil_iwinposn
      while jwinposn >= 1                     " search for a:1 in iwinposn..1
        if exists("b:cecutil_winposn{jwinposn}")    " if it exists
          if a:1 == b:cecutil_winposn{jwinposn}      " and the pattern matches
            unlet b:cecutil_winposn{jwinposn}            " unlet it
            if jwinposn == b:cecutil_iwinposn            " if at top-of-stack
              let b:cecutil_iwinposn= b:cecutil_iwinposn - 1      " drop stacktop by one
            endif
          endif
        endif
        let jwinposn= jwinposn - 1
      endwhile
    endif
  endif

  " Seems to be something odd: vertical motions after RWP
  " cause jump to first column.  The following fixes that.
  " Note: was using wincol()>1, but with signs, a cursor
  " at column 1 yields wincol()==3.  Beeping ensued.
  let vekeep= &ve
  set ve=all
  if virtcol('.') > 1
    exe s:modifier."norm! hl"
  elseif virtcol(".") < virtcol("$")
    exe s:modifier."norm! lh"
  endif
  let &ve= vekeep

  let &l:so   = so_keep
  let &l:siso = siso_keep
  let &l:ss   = ss_keep

endfun

fun! s:WinLineRestore(swwline)
  while winline() < a:swwline
    let curwinline= winline()
    exe s:modifier."norm! \<c-y>"
    if curwinline == winline()
      break
    endif
  endwhile
endfun

" ---------------------------------------------------------------------
" GoWinbufnr: go to window holding given buffer (by number) {{{2
"   Prefers current window; if its buffer number doesn't match,
"   then will try from topleft to bottom right
fun! GoWinbufnr(bufnum)
  if winbufnr(0) == a:bufnum
    return
  endif
  winc t
  let first=1
  while winbufnr(0) != a:bufnum && (first || winnr() != 1)
    winc w
    let first= 0
  endwhile
endfun


let &cpo= s:keepcpo
unlet s:keepcpo
