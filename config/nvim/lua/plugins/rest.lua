function SetupRest()
  local rest = require 'rest-nvim'

  rest.setup {
    result_split_horizontal = true,
    result_split_in_place = true,
    stay_in_current_window_after_split = true,
  }

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'http' },
    callback = function(ev)
      local opts = { buffer = ev.buf }

      vim.keymap.set({ 'n', 'i' }, '<leader>rr', function() rest.run()     end, opts)
      vim.keymap.set({ 'n', 'i' }, '<leader>rp', function() rest.run(true) end, opts)
      vim.keymap.set({ 'n', 'i' }, '<leader>rl', function() rest.last()    end, opts)
    end
  })
end

return {
  {
    'rest-nvim/rest.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'http', 'rest' },
    config = SetupRest,
  }
}
