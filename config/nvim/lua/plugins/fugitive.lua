function fugitive_init()
  -- Merge conflict resolution
  vim.keymap.set('n', '<leader>gm', ':Gdiffsplit!<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gn', ']c', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gp', '[c', { noremap = true, silent = true })

  -- Keybinds in status window
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function(e)
      local opts = { buffer = e.buf, silent = true }

      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { buffer = true, silent = true })
      vim.keymap.set('n', '<leader>gP', ':Git push -u origin HEAD<CR>', { noremap = true, silent = true })
    end,
  })
end

return {
  {
    'tpope/vim-fugitive',
    init = fugitive_init,
  }
}
