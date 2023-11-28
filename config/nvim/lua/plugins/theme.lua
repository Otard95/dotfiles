function SetupTokyonight()
  require "tokyonight".setup {
    transparent = true,
    styles = {
      sidebars = 'transparent',
    }
  }

  vim.cmd("colorscheme tokyonight-moon")
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = SetupTokyonight,
  }
}
