-- local buffer = require 'utils.buffer'

-- local function find_env(callback)
--   local pickers = require 'telescope.pickers'
--   local finders = require 'telescope.finders'
--   local sorters = require 'telescope.sorters'
--   local actions = require 'telescope.actions'
--   local actions_state = require 'telescope.actions.state'

--   local function call_with_selected(prompt_bufnr)
--     local selection = actions_state.get_selected_entry(prompt_bufnr)
--     actions.close(prompt_bufnr)
--     callback(selection.value)
--   end

--   pickers.new({}, {
--     prompt_title = 'Select .env file',
--     finder = finders.new_oneshot_job({ 'find', '.', '-type', 'f', '-name', '.env*' }),
--     sorter = sorters.get_fuzzy_file(),
--     attach_mappings = function(_, map)
--       map('i', '<CR>', call_with_selected)
--       map('n', '<CR>', call_with_selected)
--       return true
--     end
--   }):find()
-- end

function SetupRest()
  local rest = require 'rest-nvim'
  local telescope = require 'telescope'

  rest.setup {
  }

  telescope.load_extension('rest')

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'http', 'rest' },
    callback = function(ev)
      vim.opt_local.splitright = true

      local opts = { buffer = ev.buf }
      vim.keymap.set({ 'n' }, '<leader>rr', '<cmd>Rest run<CR>', opts)
      vim.keymap.set({ 'n' }, '<leader>rl', '<cmd>Rest run last<CR>', opts)
      vim.keymap.set({ 'n' }, '<leader>rs', telescope.extensions.rest.select_env, opts)
    end
  })
end

return {
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    tag = 'v3.8.3',
    ft = { 'http', 'rest' },
    config = SetupRest,
  }
}
