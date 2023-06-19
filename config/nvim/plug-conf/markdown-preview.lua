
function nvim_markdown_preview_init(paqInit)
  table.insert(paqInit, {
    'iamcco/markdown-preview.nvim',
    run = 'cd markdown-preview.nvim && yarn install'
  })
end

return nvim_markdown_preview_init
