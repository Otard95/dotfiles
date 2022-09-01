
function! Reference ()
  let l:cur_file_local_path = bufname("%")
  let l:project_name = trim(system("basename " .. getcwd()))
  let l:path = l:project_name .. "/" .. l:cur_file_local_path

  if mode() == "n"
    let l:line_start = line(".")
    let l:line_end = line(".")
    let l:column_start = col(".")
    let l:column_end = col(".")
  elseif mode() == "v"
    let [l:line_start, l:column_start] = getpos("'<")[1:2]
    let [l:line_end, l:column_end] = getpos("'>")[1:2]
  else
    echo "Error: Invalid mode argument '" .. a:mode .. "', must be 'n' or 'v'"
    return
  endif

  let l:selection = getline(l:line_start, l:line_end)

  let l:text = "`" .. l:path .. ":" .. l:line_start .. ":" .. l:column_start .. "`\n```\n" .. join(l:selection, "\n") .. "\n```"

  exec system("xclip -selection clipboard", l:text)
  exec system("xclip", l:text)
  echo 'Copied to clipboard'
endfunction
