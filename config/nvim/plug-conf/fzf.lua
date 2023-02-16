
function fzf_init(paqInit)
  table.insert(paqInit, { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end })
  table.insert(paqInit, 'junegunn/fzf.vim')
  table.insert(paqInit, 'stsewd/fzf-checkout.vim')

  vim.cmd([[
    let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
    let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

    " Customise the Files command to use rg which respects .gitignore files
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

    " Add an AllFiles variation that ignores .gitignore files
    command! -bang -nargs=? -complete=dir AllFiles
        \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

    nmap <leader>f :Files<cr>
    nmap <leader>F :AllFiles<cr>
    nmap <leader>b :Buffers<cr>
    nmap <leader>h :History<cr>
    nmap <leader>r :Rg<cr>
    nmap <leader>R :Rg<space>
    nmap <leader>gb :GBranches<cr>
    nmap <leader>L :Lines<cr>
    nmap <leader>l :BLines<cr>
  ]])
end

return fzf_init
