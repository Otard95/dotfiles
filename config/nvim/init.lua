--
--       _/|       |\_
--      /  |       |  \
--     |    \     /    |
--     |  \ /     \ /  |
--     | \  |     |  / |
--     | \ _\_/^\_/_ / |
--     |    --\//--    |
--      \_  \     /  _/
--        \__  |  __/
--           \ _ /
--          _/   \_ 
--         / _/|\_ \
--          /  |  \ 
--           / v \
--

---------------------------------
-- General settings
---------------------------------

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Colors
vim.opt.termguicolors = true

--" Use coc-spell-checker instead
-- vim.opt.spell = true
-- vim.opt.spellfile = './dictionary.latin1.add,~/.config/nvim/dictionary.latin1.add'

-- Folding
-- Temp fix for https://github.com/fannheyward/coc-rust-analyzer/issues/1113
-- vim.opt.foldmethod = 'expr'
-- vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
   vim.opt_local.foldmethod = 'expr'
    vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
  end
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function() vim.opt_local.foldmethod = 'indent' end
})

vim.opt.foldlevel = 2
-- vim.opt.foldclose = 'all'

-- Misc
vim.opt.smartcase = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = 'tab:-> ,trail:⋅'
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 10
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 2
vim.opt.mouse = 'a'

-- Explorer (Using coc-explorer)
-- let g:netrw_banner = 0
-- let g:netrw_liststyle = 3
-- let g:netrw_browse_split = 4
-- let g:netrw_altv = 1
-- let g:netrw_winsize = 15


---------------------------------
-- Custom Commands
---------------------------------

local home_dir = os.getenv('HOME')
local nvim_dir = home_dir .. '/.config/nvim'
package.path = package.path .. ';'.. nvim_dir ..'/cmds/?.lua'

vim.cmd('source ~/.config/nvim/cmds/uuid.vim')
vim.cmd('source ~/.config/nvim/cmds/buffers.vim')
vim.cmd('source ~/.config/nvim/cmds/reference.vim')
vim.cmd('source ~/.config/nvim/cmds/on-exit.vim')
require('find-replace')

---------------------------------
-- Filetype Settings
---------------------------------

vim.g.do_filetype_lua = 1

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.php',
  callback = function ()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'Dockerfile.*',
  callback = function() vim.opt_local.filetype = 'dockerfile' end
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {'*.hbs', '*.twig'},
  callback = function() vim.opt_local.filetype = 'html' end
})

---------------------------------
-- Key maps
---------------------------------

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>', {})
vim.keymap.set('n', '<leader>vr', ':so ~/.config/nvim/init.lua<cr>', {})

vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<cr>', {})

vim.keymap.set('n', 'gf', ':edit <cfile><cr>', {})

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- When text is wrapped, move by terminal rows not line, unless a count is
-- provided
vim.keymap.set('n', '<silent>', '<expr> j (v:count == 0 ? \'gj\' : \'j\')', { noremap = true })
vim.keymap.set('n', '<silent>', '<expr> k (v:count == 0 ? \'gk\' : \'k\')', { noremap = true })

-- Move between windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h', {})
-- vim.keymap.set('n', '<C-j>', '<C-w>j', {})
-- vim.keymap.set('n', '<C-k>', '<C-w>k', {})
-- vim.keymap.set('n', '<C-l>', '<C-w>l', {})

-- Paste replace visual selection without copy
vim.keymap.set('v', '<leader>p', '"_dP', { noremap = true })

-- Stop highlight
vim.keymap.set('n', '<tab>', ':noh<CR>', { noremap = true })

-- " Add word to global dictionary
-- vim.keymap.set('n', 'gzg', '2zg', {})
-- vim.keymap.set('n', 'gzw', '2zw', {})

-- Buffer cleaning
vim.keymap.set('n', '<leader>bo', ':call BufOnly()<CR>', {})

-- Copy reference
vim.keymap.set('n', '<leader>cr', '<Cmd>call Reference()<CR>', {})
vim.keymap.set('v', '<leader>cr', '<Cmd>call Reference()<CR>', {})

--" Resizing
vim.keymap.set('n', '<leader>>', ':vertical resize +4<CR>', {})
vim.keymap.set('n', '<leader><', ':vertical resize -4<CR>', {})

--" Files
vim.keymap.set('n', '<leader>c', ':!cp %:. %:h/', {})

-- Rename terminal
vim.keymap.set('n', '<leader>trn', ':keepalt file term:', {})

-- Restart TypeScript server
vim.keymap.set('n', '<leader>tsr', ':CocCommand tsserver.restart<CR>', {})

---------------------------------
-- Plugins
---------------------------------

require 'plugins'

---------------------------------
-- Theme
---------------------------------

vim.cmd('hi Pmenu guibg=#003366 gui=NONE')
vim.cmd('hi PmenuSel guibg=#115588 gui=NONE')
vim.cmd('hi PmenuSbar guibg=#bcbcbc')
vim.cmd('hi PmenuThumb guibg=#585858')
vim.cmd('hi DiffAdd guibg=bg guifg=DarkGreen gui=bold')
vim.cmd('hi DiffChange guibg=bg guifg=DarkYellow gui=bold')
vim.cmd('hi DiffDelete guibg=bg guifg=Red gui=bold')
vim.cmd('hi SignColumn guibg=bg')
vim.cmd('hi CocWarningHighlight guibg=DarkYellow guifg=Black')
vim.cmd('hi Visual guibg=#004466')

