local function SetupGH()
  require("litee.lib").setup()
  require("litee.gh").setup()
end
local function SetupOcto()
  local palette = require 'catppuccin.palettes.frappe'
  require 'octo'.setup {
    use_local_fs = true,
    default_merge_method = 'squash',
    outdated_icon = ' ',
  }

  local commands = require 'octo.commands'.commands

  vim.keymap.set('n', '<leader>gha', commands.actions, { silent = true })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "octo",
    callback = function(e)
      local opts = { buffer = e.buf, silent = true }

      vim.keymap.set('n', '<leader>rs', commands.review.start, opts)
      vim.keymap.set('n', '<leader>rr', commands.review.resume, opts)

      vim.keymap.set('n', '<leader>ch', commands.pr.checks, opts)
      vim.keymap.set('n', '<leader>cs', commands.pr.changes, opts)
      vim.keymap.set('n', '<leader>cc', commands.pr.checkout, opts)
    end,
  })

  -- highlight group colors
  vim.api.nvim_set_hl(0, 'OctoUser', { ctermbg = 0, fg = palette.text, bg = palette.surface0 })
  vim.api.nvim_set_hl(0, 'OctoReaction', { ctermbg = 0, bg = palette.surface0 })
  vim.api.nvim_set_hl(0, 'OctoReactionViewer', { ctermbg = 0, bg = palette.surface2 })
  vim.api.nvim_set_hl(0, 'OctoStateCommentedBubble', { ctermbg = 0, bg = palette.blue })

  -- {
  --   base = "#303446",
  --   blue = "#8caaee",
  --   crust = "#232634",
  --   flamingo = "#eebebe",
  --   green = "#a6d189",
  --   lavender = "#babbf1",
  --   mantle = "#292c3c",
  --   maroon = "#ea999c",
  --   mauve = "#ca9ee6",
  --   overlay0 = "#737994",
  --   overlay1 = "#838ba7",
  --   overlay2 = "#949cbb",
  --   peach = "#ef9f76",
  --   pink = "#f4b8e4",
  --   red = "#e78284",
  --   rosewater = "#f2d5cf",
  --   sapphire = "#85c1dc",
  --   sky = "#99d1db",
  --   subtext0 = "#a5adce",
  --   subtext1 = "#b5bfe2",
  --   surface0 = "#414559",
  --   surface1 = "#51576d",
  --   surface2 = "#626880",
  --   teal = "#81c8be",
  --   text = "#c6d0f5",
  --   yellow = "#e5c890"
  -- }
end

return {
  {
    "ldelossa/gh.nvim",
    dependencies = { "ldelossa/litee.nvim" },
    config = SetupGH,
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = SetupOcto,
  }
}
