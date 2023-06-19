
function fugitive_init(paqInit)
  table.insert(paqInit, 'tpope/vim-fugitive')

  -- ###############
  -- # Keybindings #
  -- ###############

  -- Merge conflict resolution
  vim.api.nvim_set_keymap('n', '<leader>gm', ':Gvdiffsplit!<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gn', ']c', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gp', '[c', { noremap = true, silent = true })
  
end

return fugitive_init
