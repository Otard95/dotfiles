---@param callback function
local function find_env(callback)
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local sorters = require 'telescope.sorters'
  local actions = require 'telescope.actions'
  local actions_state = require 'telescope.actions.state'

  local function call_with_selected(prompt_bufnr)
    local selection = actions_state.get_selected_entry(prompt_bufnr)
    actions.close(prompt_bufnr)
    callback(selection.value)
  end

  pickers.new({}, {
    prompt_title = 'Select .env file',
    finder = finders.new_oneshot_job({ 'find', '.', '-type', 'f', '-name', '.env*' }),
    sorter = sorters.get_fuzzy_file(),
    attach_mappings = function(_, map)
      map('i', '<CR>', call_with_selected)
      map('n', '<CR>', call_with_selected)
      return true
    end
  }):find()
end

function SetupRest()
  local rest = require 'rest-nvim'

  rest.setup {
    result_split_horizontal = true,
    result_split_in_place = true,
    stay_in_current_window_after_split = true,
    result = {
      show_statistics = {
        'time_total'
      },
    },
  }

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'http' },
    callback = function(ev)
      local opts = { buffer = ev.buf }

      vim.keymap.set({ 'n' }, '<leader>rr', function() rest.run() end, opts)
      vim.keymap.set({ 'n' }, '<leader>rp', function() rest.run(true) end, opts)
      vim.keymap.set({ 'n' }, '<leader>rl', function() rest.last() end, opts)
      vim.keymap.set({ 'n' }, '<leader>rs', function()
        find_env(function(file)
          rest.select_env(file)
          print('Using env file: ' .. file)
        end)
      end, opts)
    end
  })
end

return {
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    tag = 'v1.2.1',
    ft = { 'http', 'rest' },
    config = SetupRest,
  }
}
