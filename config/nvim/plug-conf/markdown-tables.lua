-- function MarkdownTablesSetup()
--   vim.api.nvim_set_keymap("n", "<Leader>tf", ':lua require("tablemd").format()<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tc", ':lua require("tablemd").insertColumn(false)<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>td", ':lua require("tablemd").deleteColumn()<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tr", ':lua require("tablemd").insertRow(false)<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tR", ':lua require("tablemd").insertRow(true)<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tj", ':lua require("tablemd").alignColumn("left")<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tk", ':lua require("tablemd").alignColumn("center")<cr>', { noremap = true })
--   vim.api.nvim_set_keymap("n", "<Leader>tl", ':lua require("tablemd").alignColumn("right")<cr>', { noremap = true })
-- end

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'PlugLoaded',
--   callback = MarkdownTablesSetup,
-- })

function nvim_markdown_init(paqInit)
  table.insert(paqInit, { 'godlygeek/tabular' })
  table.insert(paqInit, { 'preservim/vim-markdown' })
end

return nvim_markdown_init
