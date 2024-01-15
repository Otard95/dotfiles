local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
  { "folke/lazy.nvim", version = "*" },
  { import = 'plugins.align' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.barbecue' },
  { import = 'plugins.cloak' },
  { import = 'plugins.colorize' },
  { import = 'plugins.commentary' },
  { import = 'plugins.copilot' },
  -- { import = 'plugins.noice' },
  { import = 'plugins.dadbod' },
  { import = 'plugins.dap' },
  { import = 'plugins.fugitive' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.harpoon' },
  { import = 'plugins.linediff' },
  { import = 'plugins.lsp' },
  { import = 'plugins.lualine' },
  { import = 'plugins.markdown' },
  { import = 'plugins.neorg' },
  { import = 'plugins.oil' },
  { import = 'plugins.quickmaths' },
  { import = 'plugins.snippets' },
  { import = 'plugins.surround' },
  { import = 'plugins.telescope' },
  { import = 'plugins.theme' },
  { import = 'plugins.tig' },
  { import = 'plugins.tmux-navigator' },
  { import = 'plugins.tree' },
  { import = 'plugins.tree' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.trouble' },
  { import = 'plugins.undotree' },
  { import = 'plugins.visual-multi' },
}, {
  ui = {
    border = 'rounded',
  }
})
