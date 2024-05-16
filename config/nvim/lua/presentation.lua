local fn = require 'utils.fn'

local present_mode_on = false
local original_cursor = vim.opt.guicursor._value
local options = {
  relativenumber = { original = vim.opt.relativenumber, present = false },
  number = { original = vim.opt.relativenumber, present = false },
  showmode = { original = vim.opt.relativenumber, present = false },
  showcmd = { original = vim.opt.relativenumber, present = false },
  cmdheight = { original = vim.opt.relativenumber, present = 1 },
  hidden = { original = vim.opt.relativenumber, present = true },
  laststatus = { original = vim.opt.relativenumber, present = 0 },
  guicursor = { original = vim.opt.relativenumber, present = 'a:hor1' },
}

local function print_presentation_progression()
  local current = vim.fn.bufnr()
  local total_count = vim.fn.bufnr('$') - 1
  vim.print(current..'/'..total_count)
end

local function present_mode(on)
  present_mode_on = on

  for opt, value in pairs(options) do
    vim.opt[opt] = value[on and 'present' or 'original']
  end

  require('lualine').hide({ unhide = not on })
  require('barbecue.ui').toggle(not on)

  local opts = { buffer = vim.fn.bufnr(), silent = true }
  -- Navigate
  vim.keymap.set('n', 'n', ':n<CR>', opts)
  vim.keymap.set('n', '<Right>', ':n<CR>', opts)
  vim.keymap.set('n', 'p', ':N<CR>', opts)
  vim.keymap.set('n', '<Left>', ':N<CR>', opts)
  -- Reset
  vim.keymap.set('n', 'r', print_presentation_progression, opts)
  -- Ascii
  vim.keymap.set('n', '<leader>H', ':.!toilet -w 200 -f pagga<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':.!toilet -w 200 -f future<CR>', opts)
  vim.keymap.set('n', '<leader>b', ':.!toilet -w 200 -f term -F border<CR>', opts)
end

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function() vim.opt.guicursor = original_cursor end
})
vim.api.nvim_create_autocmd({'CmdlineLeave', 'BufEnter'}, {
  pattern = '*.vpm',
  callback = print_presentation_progression,
})

vim.api.nvim_create_user_command('PresentToggle', function()
  present_mode(not present_mode_on)
end, {})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.vpm',
  callback = fn.partial(present_mode, true),
})
