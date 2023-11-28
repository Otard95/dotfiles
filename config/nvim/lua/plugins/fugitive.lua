function fugitive_init()
  -- Merge conflict resolution
  vim.api.nvim_set_keymap('n', '<leader>gm', ':Gdiffsplit!<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gn', ']c', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>gp', '[c', { noremap = true, silent = true })
end

return {
  {
    'tpope/vim-fugitive',
    init = fugitive_init,
  }
}
