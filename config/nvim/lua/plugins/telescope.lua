function TelescopeSetup()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  local actions = require('telescope.actions')

  telescope.setup {
    defaults = {
      layout_strategy = 'vertical',
      mappings = {
        n = {
          ['<M-o>'] = actions.send_selected_to_qflist + actions.open_qflist,
          ['<C-o>'] = actions.send_to_qflist + actions.open_qflist,
        },
        i = {
          ['<C-o>'] = actions.send_to_qflist + actions.open_qflist,
        },
      },
      -- vimgrep_arguments = ripgrep_argsuments,
      preview = {
        filesize_limit = 5,
        filetype_hook = function (filepath)
          return not (
            filepath:find('services%.json')
            or filepath:find('%.env')
          )
          -- if filepath:find('services%.json') then return false end
          -- if filepath:find('%.env') then return false end
          -- return true
        end,
      },
    }
  }

  -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>ff', function() builtin.git_files {} end, {})
  vim.keymap.set('n', '<leader>fr', function() builtin.live_grep  {} end, {})
  vim.keymap.set('n', '<leader>fb',  function() builtin.buffers   {} end, {})
  vim.keymap.set('n', '<leader>FF', function() builtin.find_files {
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true
  } end, {})
  vim.keymap.set('n', '<leader>FR', function() builtin.live_grep  {
    -- vimgrep_arguments = ripgrep_all_arguments
    additional_args = { '--hidden' }
  } end, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = TelescopeSetup,
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
