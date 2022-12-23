
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

function vim_commentary_init(paqInit)
  table.insert(paqInit, 'tpope/vim-commentary')
end

return vim_commentary_init
