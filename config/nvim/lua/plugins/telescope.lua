function TelescopeSetup()
  local ripgrep_argsuments = {
    'rg',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case',
  }
  local ripgrep_all_arguments = {
    'rg',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case',
    '-u',
    '-u',
  }

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
      vimgrep_arguments = ripgrep_argsuments,
    }
  }

  -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>ff', function() builtin.find_files {} end, {})
  vim.keymap.set('n', '<leader>fr', function() builtin.live_grep  {} end, {})
  vim.keymap.set('n', '<leader>fb',  function() builtin.buffers   {} end, {})
  vim.keymap.set('n', '<leader>FF', function() builtin.find_files {
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true
  } end, {})
  vim.keymap.set('n', '<leader>FR', function() builtin.live_grep  {
    vimgrep_arguments = ripgrep_all_arguments
  } end, {})

  -- local theme = require('theme')
  -- local TelescopeColor = {
  --   TelescopeNormal = { fg = theme.text.base },

  --   -- Mathing
  --   TelescopeMatching = { fg = theme.text.highlight },

  --   -- Selection
  --   TelescopeSelection = { bg = theme.bg.active, fg = theme.text.light, bold = true },
  --   TelescopeSelectionCaret = { bg = theme.bg.active, fg = theme.blue.light, bold = true },
  --   TelescopeMultiSelection = { bg = theme.bg.active, fg = theme.blue.dark, bold = true },
  --   TelescopeMultiIcon = { bg = theme.bg.active, fg = theme.blue.dark, bold = true },

  --   -- Borders
  --   TelescopeBorder = { fg = theme.blue.light },
  --   -- TelescopePromptBorder = { fg = theme.blue.light },
  --   -- TelescopeResultsBorder = { fg = theme.blue.light },
  --   -- TelescopePreviewBorder = { fg = theme.blue.light },

  --   -- Titles
  --   TelescopePromptTitle = { fg = theme.blue.lighter },
  --   TelescopeResultsTitle = { fg = theme.blue.lighter },
  --   TelescopePreviewTitle = { fg = theme.blue.lighter },

  --   -- Prompt
  --   TelescopePromptCounter = { fg = theme.text.dark },

  --   -- #############################
  --   -- ## Original from telescope ##
  --   -- #############################

  --   -- -- Sets the highlight for selected items within the picker.
  --   -- TelescopeSelection = { default = true, link = "Visual" },
  --   -- TelescopeSelectionCaret = { default = true, link = "TelescopeSelection" },
  --   -- TelescopeMultiSelection = { default = true, link = "Type" },
  --   -- TelescopeMultiIcon = { default = true, link = "Identifier" },

  --   -- -- "Normal" in the floating windows created by telescope.
  --   -- TelescopeNormal = { default = true, link = "Normal" },
  --   -- TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
  --   -- TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
  --   -- TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },

  --   -- -- Border highlight groups.
  --   -- --   Use TelescopeBorder to override the default.
  --   -- --   Otherwise set them specifically
  --   -- TelescopeBorder = { default = true, link = "TelescopeNormal" },
  --   -- TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
  --   -- TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
  --   -- TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },

  --   -- -- Title highlight groups.
  --   -- --   Use TelescopeTitle to override the default.
  --   -- --   Otherwise set them specifically
  --   -- TelescopeTitle = { default = true, link = "TelescopeBorder" },
  --   -- TelescopePromptTitle = { default = true, link = "TelescopeTitle" },
  --   -- TelescopeResultsTitle = { default = true, link = "TelescopeTitle" },
  --   -- TelescopePreviewTitle = { default = true, link = "TelescopeTitle" },

  --   -- TelescopePromptCounter = { default = true, link = "NonText" },

  --   -- -- Used for highlighting characters that you match.
  --   -- TelescopeMatching = { default = true, link = "Special" },

  --   -- -- Used for the prompt prefix
  --   -- TelescopePromptPrefix = { default = true, link = "Identifier" },

  --   -- -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
  --   -- TelescopePreviewLine = { default = true, link = "Visual" },
  --   -- TelescopePreviewMatch = { default = true, link = "Search" },

  --   -- TelescopePreviewPipe = { default = true, link = "Constant" },
  --   -- TelescopePreviewCharDev = { default = true, link = "Constant" },
  --   -- TelescopePreviewDirectory = { default = true, link = "Directory" },
  --   -- TelescopePreviewBlock = { default = true, link = "Constant" },
  --   -- TelescopePreviewLink = { default = true, link = "Special" },
  --   -- TelescopePreviewSocket = { default = true, link = "Statement" },
  --   -- TelescopePreviewRead = { default = true, link = "Constant" },
  --   -- TelescopePreviewWrite = { default = true, link = "Statement" },
  --   -- TelescopePreviewExecute = { default = true, link = "String" },
  --   -- TelescopePreviewHyphen = { default = true, link = "NonText" },
  --   -- TelescopePreviewSticky = { default = true, link = "Keyword" },
  --   -- TelescopePreviewSize = { default = true, link = "String" },
  --   -- TelescopePreviewUser = { default = true, link = "Constant" },
  --   -- TelescopePreviewGroup = { default = true, link = "Constant" },
  --   -- TelescopePreviewDate = { default = true, link = "Directory" },
  --   -- TelescopePreviewMessage = { default = true, link = "TelescopePreviewNormal" },
  --   -- TelescopePreviewMessageFillchar = { default = true, link = "TelescopePreviewMessage" },

  --   -- -- Used for Picker specific Results highlighting
  --   -- TelescopeResultsClass = { default = true, link = "Function" },
  --   -- TelescopeResultsConstant = { default = true, link = "Constant" },
  --   -- TelescopeResultsField = { default = true, link = "Function" },
  --   -- TelescopeResultsFunction = { default = true, link = "Function" },
  --   -- TelescopeResultsMethod = { default = true, link = "Method" },
  --   -- TelescopeResultsOperator = { default = true, link = "Operator" },
  --   -- TelescopeResultsStruct = { default = true, link = "Struct" },
  --   -- TelescopeResultsVariable = { default = true, link = "SpecialChar" },

  --   -- TelescopeResultsLineNr = { default = true, link = "LineNr" },
  --   -- TelescopeResultsIdentifier = { default = true, link = "Identifier" },
  --   -- TelescopeResultsNumber = { default = true, link = "Number" },
  --   -- TelescopeResultsComment = { default = true, link = "Comment" },
  --   -- TelescopeResultsSpecialComment = { default = true, link = "SpecialComment" },

  --   -- -- Used for git status Results highlighting
  --   -- TelescopeResultsDiffChange = { default = true, link = "DiffChange" },
  --   -- TelescopeResultsDiffAdd = { default = true, link = "DiffAdd" },
  --   -- TelescopeResultsDiffDelete = { default = true, link = "DiffDelete" },
  --   -- TelescopeResultsDiffUntracked = { default = true, link = "NonText" },
  -- }

  -- for hl, col in pairs(TelescopeColor) do
  --   vim.api.nvim_set_hl(0, hl, col)
  -- end
end

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = TelescopeSetup,
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
