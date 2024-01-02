function SetupTheme()
  require "tokyonight".setup {
    transparent = true,
    styles = {
      sidebars = 'transparent',
    }
  }

  require 'catppuccin'.setup {
    flavour = 'frappe',
    transparent_background = true,
  }

  vim.cmd.colorscheme "catppuccin"
  -- vim.cmd.colorscheme "tokyonight-moon"
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- config = SetupTheme,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = SetupTheme,
  }
}
