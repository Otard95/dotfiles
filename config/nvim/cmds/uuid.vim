
" Create UUID
function! s:UUID()
  let l:x = col('.')
  let l:y = line('.')
  :read !cat /proc/sys/kernel/random/uuid
  exec "normal i\<Backspace>\<Esc>\<Right>d$"
  call cursor(l:y,l:x)
  exec "normal p"
  " exec "normal"." k"
  " join
endfunction
command! UUID call s:UUID()

