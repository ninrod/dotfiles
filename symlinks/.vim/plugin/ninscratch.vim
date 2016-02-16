if exists('loaded_scratch') || &cp
    finish
endif
let loaded_scratch=1

let ScratchBufferName = "__Scratch__"
function! s:ScratchBufferOpen()
  " Check whether the scratch buffer is already created
  let scr_bufnum = bufnr(g:ScratchBufferName)
  if scr_bufnum == -1
    " open a new scratch buffer
    exe "edit " . g:ScratchBufferName
  else
    " Scratch buffer is already created. Check whether it is open
    " in one of the windows
    let scr_winnum = bufwinnr(scr_bufnum)
    if scr_winnum != -1
      " Jump to the window which has the scratch buffer if we are not
      " already in that window
      if winnr() != scr_winnum
        exe scr_winnum . "wincmd w"
      endif
    else
      " Create a new scratch buffer
      exe "buffer " . scr_bufnum
    endif
  endif
endfunction

" ScratchMarkBuffer Mark a buffer as scratch
function! s:ScratchMarkBuffer()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal buflisted
endfunction

autocmd BufNewFile __Scratch__ call s:ScratchMarkBuffer()

" Command to invoke the scratch buffer
command! -nargs=0 NinScratch call s:ScratchBufferOpen()
