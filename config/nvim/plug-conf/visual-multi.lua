
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

function visual_multi_init(paqInit)
  table.insert(paqInit, { 'mg979/vim-visual-multi', { 'branch': 'master'} })
end

return visual_multi_init

