local options = {
  c = {
    commentstring = '//%s',
  },
  cpp = {
    commentstring = '//%s',
  },
}

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"*"},
  callback = function (event)
    local ft = event.match
    if options[ft] then
      for k, v in pairs(options[ft]) do
        vim.opt_local[k] = v
      end
    end
  end,
})
