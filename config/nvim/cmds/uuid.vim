
" Create UUID
function! s:UUID()
  let l:x = col('.')
  let l:y = line('.')
  :read !cat /proc/sys/kernel/random/uuid
  exec "normal"." k"
  join
  call cursor(l:y,l:x)
endfunction
command! UUID call s:UUID()

