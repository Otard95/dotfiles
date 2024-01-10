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

  vim.api.nvim_set_keymap('n', '-', '<cmd>Oil<cr>', { noremap = true })
end

return {
  {
    'stevearc/oil.nvim',
    config = OilSetup,
  }
}
