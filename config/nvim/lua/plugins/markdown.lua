function markdown_preview_init()
  vim.cmd [[
    function! MarkdownPreviewOpenBrowser(url)
      call system('/opt/firefox/firefox -P markdown-preview ' . a:url . ' &')
    endfunction
  ]]

  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_browserfunc = 'MarkdownPreviewOpenBrowser'
  vim.g.mkdp_page_title = '「${name}」 - Markdown Preview'
end

function render_markdown_init()
  require 'render-markdown'.setup {
    checkbox = {
      custom = {
        todo = { raw = '[-]', rendered = '󰥔', highlight = 'RenderMarkdownTodo' },
        follow_up = { raw = '[>]', rendered = '󰬪', highlight = 'WarningMsg' },
        canceled = { raw = '[~]', rendered = '󰅙', highlight = 'ErrorMsg' },
      },
    },
  }
end

return {
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   build = 'yarn install',
  --   init = markdown_preview_init,
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    init = render_markdown_init,
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  }
}
