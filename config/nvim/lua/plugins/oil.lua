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

return {
  {
    'stevearc/oil.nvim',
    config = OilSetup,
  }
}
