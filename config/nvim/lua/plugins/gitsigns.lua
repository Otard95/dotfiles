return {
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

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>ghn', gs.next_hunk)
        map('n', '<leader>ghp', gs.prev_hunk)

        -- Actions
        map('n', '<leader>ghs', gs.stage_hunk)
        map('n', '<leader>ghr', gs.reset_hunk)
        map('v', '<leader>ghs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>ghr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>ghi', gs.preview_hunk)
      end,
    },
  }
}
