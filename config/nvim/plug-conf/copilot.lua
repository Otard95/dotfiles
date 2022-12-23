
function copilot_init(paqInit)
  table.insert(paqInit, 'github/copilot.vim')

  vim.keymap.set('i', '<C-j>', 'copilot#Accept()', {
    script = true,
    silent = true,
    nowait = true,
    expr = true,
    nowait = true,
  })
  -- let g:copilot_no_tab_map = v:true
  vim.g.copilot_no_tab_map = true
end

return copilot_init

