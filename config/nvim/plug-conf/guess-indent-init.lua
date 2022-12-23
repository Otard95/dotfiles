
function GuessIndentInit()
  require('guess-indent').setup {}
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'PlugLoaded',
  callback = GuessIndentInit,
})

function guess_indent_init(paqInit)
  table.insert(paqInit, 'nmac427/guess-indent.nvim')
end

return guess_indent_init

