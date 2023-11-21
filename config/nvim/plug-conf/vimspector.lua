
function vimspector_init(paqInit)
  table.insert(paqInit, 'puremourning/vimspector')

  vim.keymap.set('n', '<leader>dr', '<Plug>VimspectorContinue', {})
  vim.keymap.set('n', '<leader>dss', '<Plug>VimspectorStop', {})
  vim.keymap.set('n', '<leader>dsr', ':VimspectorReset<CR>', {})
  vim.keymap.set('n', '<leader>dp', '<Plug>VimspectorPause', {})
  vim.keymap.set('n', '<leader>dbb', '<Plug>VimspectorToggleBreakpoint', {})
  vim.keymap.set('n', '<leader>dbc', '<Plug>VimspectorToggleConditionalBreakpoint', {})
  vim.keymap.set('n', '<leader>dl', '<Plug>VimspectorRunToCursor', {})
  vim.keymap.set('n', '<leader>dn', '<Plug>VimspectorStepOver', {})
  vim.keymap.set('n', '<leader>di', '<Plug>VimspectorStepInto', {})
  vim.keymap.set('n', '<leader>do', '<Plug>VimspectorStepOut', {})
  vim.keymap.set('n', '<leader>dk', '<Plug>VimspectorBalloonEval', {})

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

