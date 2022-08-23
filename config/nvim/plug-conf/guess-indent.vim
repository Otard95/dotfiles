Plug 'nmac427/guess-indent.nvim'

function GuessIndentInit()
lua <<EOF
require('guess-indent').setup {}
EOF
endfunction

augroup GuessIndent
  autocmd!
  autocmd User PlugLoaded call GuessIndentInit()
augroup END

