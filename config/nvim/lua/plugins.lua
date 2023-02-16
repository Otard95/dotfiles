local paqInit = {
    "savq/paq-nvim"; -- Let Paq manage itself
}

local home_dir = os.getenv('HOME')
local nvim_dir = home_dir .. '/.config/nvim'
package.path = package.path .. ';'.. nvim_dir ..'/plug-conf/?.lua'

require 'airline' (paqInit)
require 'fugitive' (paqInit)
require 'quickmaths' (paqInit)
require 'qalc-nvim' (paqInit)
require 'nvim-align' (paqInit)
require 'treesitter' (paqInit)
-- require 'autopairs' (paqInit)
require 'commentary' (paqInit)
require 'copilot' (paqInit)
require 'fzf' (paqInit)
require 'guess-indent-init' (paqInit)
require 'surround' (paqInit)
require 'tig' (paqInit)
require 'vimspector' (paqInit)
require 'coc' (paqInit)
require 'visual-multi' (paqInit)
-- require 'remote-containers' (paqInit)
require 'vim-tmux-navigator' (paqInit)

require "paq" (paqInit)

vim.api.nvim_exec('doautocmd User PlugLoaded', false)
