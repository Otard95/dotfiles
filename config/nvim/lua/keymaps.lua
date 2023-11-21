
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

vim.keymap.set('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>', {})
vim.keymap.set('n', '<leader>vr', ':so ~/.config/nvim/init.lua<cr>', {})

vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<cr>', {})

vim.keymap.set('n', 'gf', ':edit <cfile><cr>', {})

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- When text is wrapped, move by terminal rows not line, unless a count is
-- provided
-- vim.keymap.set('n', '<silent>', '<expr> j (v:count == 0 ? \'gj\' : \'j\')', { noremap = true })
-- vim.keymap.set('n', '<silent>', '<expr> k (v:count == 0 ? \'gk\' : \'k\')', { noremap = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('v', 'j', 'gj', { noremap = true })
vim.keymap.set('v', 'k', 'gk', { noremap = true })

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
-- vim.keymap.set('n', '<leader>trn', ':keepalt file term:', {})

-- Restart TypeScript server
vim.keymap.set('n', '<leader>tsr', ':CocCommand tsserver.restart<CR>', {})
