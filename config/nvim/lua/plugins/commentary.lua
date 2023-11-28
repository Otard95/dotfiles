function commentary_init()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'typescript',
    callback = function()
      vim.bo.commentstring = '// %s'
    end,
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'php',
    callback = function()
      vim.bo.commentstring = '// %s'
    end,
  })
end

return {
  {
    'tpope/vim-commentary',
    init = commentary_init,
  }
}
