
function coc_init(paqInit)
  -- Plug 'neoclide/coc.nvim', {'branch': 'release'}
  -- Plug 'antoinemadec/coc-fzf'
  table.insert(paqInit, { 'neoclide/coc.nvim', branch = 'release' })
  table.insert(paqInit, 'antoinemadec/coc-fzf')

  -- let g:coc_global_extensions = [
  --     \ 'coc-diagnostic',
  --     \ 'coc-eslint',
  --     \ 'coc-git',
  --     \ 'coc-json',
  --     \ 'coc-pairs',
  --     \ 'coc-phpls',
  --     \ 'coc-php-cs-fixer',
  --     \ 'coc-sh',
  --     \ 'coc-snippets',
  --     \ 'coc-sql',
  --     \ 'coc-tsserver',
  --     \ 'coc-spell-checker',
  --     \ 'coc-docker',
  --     \ 'coc-html',
  --     \ 'coc-emmet',
  --     \ 'coc-explorer',
  --     \ 'coc-rust-analyzer',
  -- \ ]
  vim.g.coc_global_extensions = {
   'coc-diagnostic';
   'coc-eslint';
   'coc-git';
   'coc-json';
   'coc-pairs';
   'coc-phpls';
   'coc-php-cs-fixer';
   'coc-sh';
   'coc-snippets';
   'coc-sql';
   'coc-tsserver';
   'coc-spell-checker';
   'coc-docker';
   'coc-html';
   'coc-emmet';
   'coc-explorer';
   'coc-rust-analyzer';
  }

  -- :nmap <space>\ <Cmd>CocCommand explorer<CR>
  vim.keymap.set('n', '<space>\\', '<Cmd>CocCommand explorer<CR>')

  -- function! s:check_back_space() abort
  --   let col = col('.') - 1
  --   return !col || getline('.')[col - 1]  =~# '\s'
  -- endfunction
  local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- " Use tab for trigger completion with characters ahead and navigate.
  -- " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  -- " other plugin before putting this into your config.
  -- inoremap <silent><expr> <TAB>
  --       \ coc#pum#visible() ? coc#pum#next(1) :
  --       \ <SID>check_back_space() ? "\<TAB>" :
  --       \ coc#refresh()
  -- inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  -- vim.keymap.set('i', '<TAB>', [[coc#pum#visible() ? coc#pum#next(1) : <SID>check_back_space() ? "\<TAB>" : coc#refresh()]], { silent = true, expr = true, noremap = true })
  vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { expr = true, noremap = true })
  vim.keymap.set('i', '<TAB>', function()
    if vim.fn['coc#pum#visible']() then
      return vim.fn['coc#pum#next'](1)
    elseif check_back_space() then
      return vim.cmd([[<TAB>]])
    else
      return vim.fn['coc#refresh']()
    end
  end, { silent = true, expr = true, noremap = true })

  -- " Use <c-space> to trigger completion.
  -- if has('nvim')
  --   inoremap <silent><expr> <C-space> coc#refresh()
  -- else
  --   inoremap <silent><expr> <c-@> coc#refresh()
  -- endif
  if vim.fn.has('nvim') == 1 then
    vim.keymap.set('i', '<C-space>', [[coc#refresh()]], { silent = true, expr = true, noremap = true })
  else
    vim.keymap.set('i', '<c-@>', [[coc#refresh()]], { silent = true, expr = true, noremap = true })
  end

  -- " Make <CR> auto-select the first completion item and notify coc.nvim to
  -- " format on enter, <cr> could be remapped by other vim plugin
  -- inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm()
  --                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  vim.keymap.set('i', '<cr>', [[coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true, noremap = true })

  -- " Use `[g` and `]g` to navigate diagnostics
  -- " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  -- nmap <silent> [d <Plug>(coc-diagnostic-prev)
  -- nmap <silent> ]d <Plug>(coc-diagnostic-next)
  -- nmap <silent> <leader>d <Plug>(coc-diagnostic-info)
  vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })

  -- " GoTo code navigation.
  -- nmap <silent> gd <Plug>(coc-definition)
  -- nmap <silent> gy <Plug>(coc-type-definition)
  -- nmap <silent> gi <Plug>(coc-implementation)
  -- nmap <silent> gr <Plug>(coc-references)
  vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
  vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)')
  vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)')
  vim.keymap.set('n', 'gr', '<Plug>(coc-references)')

  -- nmap <silent> <leader>gi <Plug>(coc-git-chunkinfo)
  -- nmap <silent> ]g <Plug>(coc-git-nextchunk)
  -- nmap <silent> [g <Plug>(coc-git-prevchunk)
  -- nmap <silent> <leader>gu :CocCommand git.chunkUndo<cr>
  -- nmap <silent> <leader>gs :CocCommand git.chunkStage<cr>
  vim.keymap.set('n', '<leader>gi', '<Plug>(coc-git-chunkinfo)')
  vim.keymap.set('n', ']g', '<Plug>(coc-git-nextchunk)')
  vim.keymap.set('n', '[g', '<Plug>(coc-git-prevchunk)')
  vim.keymap.set('n', '<leader>gu', ':CocCommand git.chunkUndo<cr>')
  vim.keymap.set('n', '<leader>gs', ':CocCommand git.chunkStage<cr>')

  -- " apply autofix to problem on the current line.
  -- nmap <leader>af  <plug>(coc-fix-current)
  -- nmap <leader>am  <plug>(coc-format-selected)
  -- xmap <leader>am  <plug>(coc-format-selected)
  -- nmap <leader>ac  <Plug>(coc-codeaction)
  vim.keymap.set('n', '<leader>af', '<plug>(coc-fix-current)')
  vim.keymap.set('n', '<leader>am', '<plug>(coc-format-selected)')
  vim.keymap.set('x', '<leader>am', '<plug>(coc-format-selected)')
  vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)')

  -- " Applying codeAction to the selected region.
  -- " Example: `<leader>aap` for current paragraph
  -- xmap <leader>a  <Plug>(coc-codeaction-selected)
  -- nmap <leader>a  <Plug>(coc-codeaction-selected)
  -- nmap <leader>ga  <Plug>(coc-codeaction-line)
  vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
  vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)')
  vim.keymap.set('n', '<leader>ga', '<Plug>(coc-codeaction-line)')

  -- " Map function and class text objects
  -- " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  -- xmap if <Plug>(coc-funcobj-i)
  -- omap if <Plug>(coc-funcobj-i)
  -- xmap af <Plug>(coc-funcobj-a)
  -- omap af <Plug>(coc-funcobj-a)
  -- xmap ic <Plug>(coc-classobj-i)
  -- omap ic <Plug>(coc-classobj-i)
  -- xmap ac <Plug>(coc-classobj-a)
  -- omap ac <Plug>(coc-classobj-a)
  vim.keymap.set('x', 'if', '<Plug>(coc-funcobj-i)')
  vim.keymap.set('o', 'if', '<Plug>(coc-funcobj-i)')
  vim.keymap.set('x', 'af', '<Plug>(coc-funcobj-a)')
  vim.keymap.set('o', 'af', '<Plug>(coc-funcobj-a)')
  vim.keymap.set('x', 'ic', '<Plug>(coc-classobj-i)')
  vim.keymap.set('o', 'ic', '<Plug>(coc-classobj-i)')
  vim.keymap.set('x', 'ac', '<Plug>(coc-classobj-a)')
  vim.keymap.set('o', 'ac', '<Plug>(coc-classobj-a)')

  -- function! s:show_documentation()
  --   if (index(['vim','help'], &filetype) >= 0)
  --     execute 'h '.expand('<cword>')
  --   elseif (coc#rpc#ready())
  --     call CocActionAsync('doHover')
  --   else
  --     execute '!' . &keywordprg . " " . expand('<cword>')
  --   endif
  -- endfunction
  local function show_documentation()
    if vim.tbl_contains({'vim', 'help'}, vim.bo.filetype) then
      vim.cmd('h ' .. vim.fn.expand('<cword>'))
    elseif vim.fn['coc#rpc#ready']() then
      vim.fn['CocActionAsync']('doHover')
    else
      vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
    end
  end

  -- " Use K to show documentation in preview window.
  -- nnoremap <silent> K :call <SID>show_documentation()<CR>
  vim.keymap.set('n', 'K', function() show_documentation() end, { noremap = false })

  -- " Highlight the symbol and its references when holding the cursor.
  -- " autocmd CursorHold * silent call CocActionAsync('highlight')
  -- nmap <leader>hl :call CocActionAsync('highlight')<CR>
  vim.keymap.set('n', '<leader>hl', ':call CocActionAsync(\'highlight\')<CR>')

  -- " Symbol renaming.
  -- nmap <leader>rn <Plug>(coc-rename)
  vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

  -- " Remap <C-f> and <C-b> for scroll float windows/popups.
  -- nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  -- nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  -- inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  -- inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  -- vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  -- vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  vim.keymap.set('n', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<C-f>\'', { noremap = false })
  vim.keymap.set('n', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<C-b>\'', { noremap = false })
  vim.keymap.set('i', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? \'<c-r>=coc#float#scroll(1)<cr>\' : \'<Right>\'', { noremap = false })
  vim.keymap.set('i', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? \'<c-r>=coc#float#scroll(0)<cr>\' : \'<Left>\'', { noremap = false })
  vim.keymap.set('v', '<silent><nowait><expr> <C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : \'<C-f>\'', { noremap = false })
  vim.keymap.set('v', '<silent><nowait><expr> <C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : \'<C-b>\'', { noremap = false })

  -- " Add `:Format` command to format current buffer.
  -- command! -nargs=0 Format :call CocAction('format')
  vim.api.nvim_create_user_command('Format', ':call CocAction(\'format\')', { nargs = 0 })

  -- " Add `:Fold` command to fold current buffer.
  -- command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  vim.api.nvim_create_user_command('Fold', ':call CocAction(\'fold\', <f-args>)', { nargs = '*' })

  -- " Add `:OR` command for organize imports of the current buffer.
  -- command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  vim.api.nvim_create_user_command('OR', ':call CocAction(\'runCommand\', \'editor.action.organizeImport\')', { nargs = 0 })

  -- nmap <leader>l :CocFzfList<cr>
  vim.keymap.set('n', '<leader>l', ':CocFzfList<cr>')

  -- """ Snippets

  -- " Use <C-l> for trigger snippet expand.
  -- imap <C-l> <Plug>(coc-snippets-expand)
  vim.keymap.set('i', '<C-l>', '<Plug>(coc-snippets-expand)')

  -- " Use <C-j> for select text for visual placeholder of snippet.
  -- vmap <C-j> <Plug>(coc-snippets-select)
  vim.keymap.set('v', '<C-j>', '<Plug>(coc-snippets-select)')

  -- " Use <tab> for expand snippet.
  -- inoremap <silent><expr> <TAB>
  --       \ coc#pum#visible() ? coc#_select_confirm() :
  --       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  --       \ <SID>check_back_space() ? "\<TAB>" :
  --       \ coc#refresh()
  -- vim.keymap.set('i', '<silent><expr> <TAB>', 'coc#pum#visible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? \'<C-r>=coc#rpc#request(\'doKeymap\', [\'snippets-expand-jump\',\'\'])<CR>\' : <SID>check_back_space() ? \'<TAB>\' : coc#refresh()', { noremap = false })
  vim.keymap.set('i', '<silent><expr> <TAB>', function()
    if vim.fn['coc#pum#visible']() then
      return vim.fn['coc#_select_confirm']()
    elseif vim.fn['coc#expandableOrJumpable']() then
      return vim.fn['coc#rpc#request']('doKeymap', {'snippets-expand-jump', ''})
    elseif check_back_space() then
      return '<TAB>'
    else
      return vim.fn['coc#refresh']()
    end
  end, { noremap = false })

  -- let g:coc_snippet_next = '<tab>'
  vim.g.coc_snippet_next = '<tab>'
end

return coc_init

