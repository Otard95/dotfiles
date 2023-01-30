
function copilot_init(paqInit)
  table.insert(paqInit, 'github/copilot.vim')

  -- local map = function (type, key, value, opts)
  --   local options = { noremap = true }
  --   if opts then options = vim.tbl_extend('force', options, opts) end
  --   vim.api.nvim_set_keymap(type, key, value, options)
  -- end
  -- vim.keymap.set("i", "<C-j>", 'copilot#Accept()', { silent = true, expr = true, noremap = true })
  vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept('<CR>')", { silent = true, expr = true, noremap = true })
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true

  -- vim.keymap.set('i', '<C-j>', 'copilot#Accept()', {
  --   script = true,
  --   silent = true,
  --   nowait = true,
  --   expr = true,
  --   nowait = true,
  -- })
  -- -- let g:copilot_no_tab_map = v:true
  -- vim.g.copilot_no_tab_map = true
end

return copilot_init

