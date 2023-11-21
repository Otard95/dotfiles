
vim.cmd [[
  function! MarkdownPreviewOpenBrowser(url)
    call system('/opt/firefox/firefox -P markdown-preview ' . a:url . ' &')
  endfunction
]]

function nvim_markdown_preview_init(paqInit)
  table.insert(paqInit, {
    'iamcco/markdown-preview.nvim',
    run = 'cd markdown-preview.nvim && yarn install'
  })

  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_browserfunc = 'MarkdownPreviewOpenBrowser'
  vim.g.mkdp_page_title = '「${name}」 - Markdown Preview'
end

return nvim_markdown_preview_init
