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

local function url_encode(text)
  local handle = io.popen('python3 -c "import urllib.parse as ul; print(ul.quote(\\"'..text..'\\"))"')
  if handle == nil then
    vim.notify('Failed to open pipe for writing', vim.log.levels.ERROR)
    return nil
  end

  local result = handle:read('*a')
  handle:close()

  return result:gsub("\n", "")
end

local function url_encode_visual()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines == 0 then return end

  -- Handle multi-line selections
  if #lines > 1 then
    lines[1] = lines[1]:sub(start_pos[3])
    lines[#lines] = lines[#lines]:sub(1, end_pos[3])
  else
    lines[1] = lines[1]:sub(start_pos[3], end_pos[3])
  end

  local text = table.concat(lines, "\n")
  local encoded = url_encode(text)
  if encoded == nil then
    vim.notify('URL encoding failed', vim.log.levels.ERROR)
    return
  end

  -- Replace only the selected text with encoded text
  if #lines > 1 then
    vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], vim.split(encoded, "\n"))
  else
    vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, start_pos[2] - 1, end_pos[3], { encoded })
  end
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

  vim.api.nvim_create_user_command('URLEncode', url_encode_visual, { range = true })

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
