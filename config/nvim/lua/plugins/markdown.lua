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

return {
  {
    'preservim/vim-markdown',
    dependencies = {
      'godlygeek/tabular'
    }
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'yarn install',
    init = markdown_preview_init,
  }
}
