function OilSetup()
  require'oil'.setup {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
    }
  }
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'PlugLoaded',
  callback = OilSetup
})

function oil_init(paqInit)
  table.insert(paqInit, 'stevearc/oil.nvim')
end

return oil_init
