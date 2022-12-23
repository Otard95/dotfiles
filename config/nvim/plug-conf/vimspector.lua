
function vimspector_init(paqInit)
  table.insert(paqInit, 'puremourning/vimspector')

  vim.keymap.set('n', '<C-g><C-s>', '<Plug>VimspectorContinue', {})
  vim.keymap.set('n', '<C-g><C-s><C-s>', '<Plug>VimspectorStop', {})
  vim.keymap.set('n', '<C-g><C-r>', ':VimspectorReset<CR>', {})
  vim.keymap.set('n', '<C-g><C-p>', '<Plug>VimspectorPause', {})
  vim.keymap.set('n', '<C-g><C-b><C-b>', '<Plug>VimspectorToggleBreakpoint', {})
  vim.keymap.set('n', '<C-g><C-b>c', '<Plug>VimspectorToggleConditionalBreakpoint', {})
  vim.keymap.set('n', '<C-g><C-l>', '<Plug>VimspectorRunToCursor', {})
  vim.keymap.set('n', '<C-g><C-n>', '<Plug>VimspectorStepOver', {})
  vim.keymap.set('n', '<C-g><C-i>', '<Plug>VimspectorStepInto', {})
  vim.keymap.set('n', '<C-g><C-o>', '<Plug>VimspectorStepOut', {})
  vim.keymap.set('n', '<C-g><C-k>', '<Plug>VimspectorBalloonEval', {})

  vim.g.vimspector_sign_priority = {
     vimspectorBP = 13,
     vimspectorBPCond = 12,
     vimspectorBPLog = 12,
     vimspectorBPDisabled = 11,
     vimspectorPC = 999,
  }

  -- vim.cmd([[
  --   let g:vimspector_sign_priority = {
  --     \    'vimspectorBP':         13,
  --     \    'vimspectorBPCond':     12,
  --     \    'vimspectorBPLog':      12,
  --     \    'vimspectorBPDisabled': 11,
  --     \    'vimspectorPC':         999,
  --     \ }
  -- ]])
end

return vimspector_init

