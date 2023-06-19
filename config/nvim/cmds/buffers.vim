
" Remove all but current buffer
function BufOnly ()
  let l:winview = winsaveview()
  execute "%bd|e#|bd#"
  call winrestview(l:winview)
endfunction

" Create user command
command! BufOnly call BufOnly()
