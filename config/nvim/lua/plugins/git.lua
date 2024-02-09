local function create_branch()
  local branch = vim.fn.input('Branch name: ')
  if branch == '' or branch == nil then
    print('Aborting branch creation.')
    return
  end
  vim.cmd('Git checkout -b ' .. branch)
end
local function reload_branch_list()
  vim.cmd('bd! | Git branch')
end
local function delete_branch_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local branch = string.gsub(line, "^%s*%*?%s*(.-)%s*$", "%1")
  vim.cmd('Git branch -d ' .. branch)
end

function SetupFugitive()
  local fn = require 'utils.fn'

  -- Merge conflict resolution
  vim.keymap.set('n', '<leader>gm', ':Gdiffsplit!<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gn', ']c', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gp', '[c', { noremap = true, silent = true })

  -- Keybinds in status window
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function(e)
      local opts = { buffer = e.buf, silent = true }

      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', opts)
      vim.keymap.set('n', '<leader>gP', ':Git push -u origin HEAD<CR>', opts)
      vim.keymap.set('n', '<leader>gu', ':Git pull<CR>', opts)
      vim.keymap.set('n', '<leader>gb', ':Git branch<CR>', opts)

      vim.keymap.set('n', '<leader>ba', create_branch, opts)
    end,
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "git",
    callback = function(e)
      local opts = { buffer = e.buf, silent = true }

      vim.keymap.set('n', '<C-r>', reload_branch_list, opts)
      vim.keymap.set('n', '<leader>a', fn.flow(create_branch,reload_branch_list), opts)
      vim.keymap.set('n', '<leader>dd', fn.flow(delete_branch_under_cursor, reload_branch_list), opts)
    end,
  })
end

local function SetupOcto()
  local palette = require 'catppuccin.palettes.frappe'
  require 'octo'.setup {
    use_local_fs = true,
    default_merge_method = 'squash',
    outdated_icon = ' ',
    colors = {
      white = palette.text,
      grey = palette.surface0,
      black = palette.mantle,
      red = palette.flamingo,
      dark_red = palette.red,
      green = palette.sky,
      dark_green = palette.green,
      yellow = palette.yellow,
      dark_yellow = palette.peach,
      blue = palette.blue,
      dark_blue = palette.sapphire,
      purple = palette.mauve,
    }
  }

  local octo = require 'octo.commands'.octo

  vim.keymap.set('n', '<leader>gha', function () octo('actions') end, { silent = true })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "octo",
    callback = function(e)
      local opts = { buffer = e.buf, silent = true }

      vim.keymap.set('n', '<leader>ch', function () octo('pr', 'checks') end, opts)
      vim.keymap.set('n', '<leader>cs', function () octo('pr', 'changes') end, opts)
      vim.keymap.set('n', '<leader>cc', function () octo('pr', 'checkout') end, opts)
    end,
  })

  -- highlight group colors
  vim.api.nvim_set_hl(0, 'OctoUser', { fg = palette.text, bg = palette.overlay1 })
end

return {
  {
    'tpope/vim-fugitive',
    init = SetupFugitive,
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = SetupOcto,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local opts = { buffer = bufnr }

        -- Navigation
        vim.keymap.set('n', '<leader>ghn', gs.next_hunk, opts)
        vim.keymap.set('n', '<leader>ghp', gs.prev_hunk, opts)

        -- Actions
        vim.keymap.set('n', '<leader>ghs', gs.stage_hunk, opts)
        vim.keymap.set('n', '<leader>ghr', gs.reset_hunk, opts)
        vim.keymap.set('v', '<leader>ghs', function()
          gs.stage_hunk {
            vim.fn.line('.'),
            vim.fn.line('v')
          }
        end, opts)
        vim.keymap.set('v', '<leader>ghr', function()
          gs.reset_hunk {
            vim.fn.line('.'),
            vim.fn.line('v')
          }
        end, opts)
        vim.keymap.set('n', '<leader>ghi', gs.preview_hunk, opts)
      end,
    },
  }
}
