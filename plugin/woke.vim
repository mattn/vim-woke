function! s:woke(...) abort
  if a:0 ==# 0
    cexpr system('woke')
    return
  endif
  let l:path = expand(a:000[0])
  if isdirectory(a:000[0])
    cexpr system('woke ' .. shellescape(l:path))
  else
    cexpr system('woke --stdin', readfile(l:path))
  endif
endfunction

command! -nargs=? Woke call s:woke(<f-args>)
