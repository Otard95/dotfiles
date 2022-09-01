function OnExit ()
  let projectRoot = getcwd()
  call system("watchman watch-del " . projectRoot)
endfunction

au VimLeave * call OnExit()
