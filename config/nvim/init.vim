"       _/|       |\_
"      /  |       |  \
"     |    \     /    |
"     |  \ /     \ /  |
"     | \  |     |  / |
"     | \ _\_/^\_/_ / |
"     |    --\//--    |
"      \_  \     /  _/
"        \__  |  __/
"           \ _ /
"          _/   \_ 
"         / _/|\_ \
"          /  |  \ 
"           / v \
"

"-------------------------------
" General settings
"-------------------------------

set expandtab
set shiftwidth=2
set tabstop=2
set relativenumber
set number
set termguicolors
set spell
set spellfile=./dictionary.latin1.add,~/.config/nvim/dictionary.latin1.add
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:->\ ,trail:⋅
set scrolloff=10
set sidescrolloff=10
set clipboard+=unnamedplus
set cmdheight=2

"-------------------------------
" Key maps
"-------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :so ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>

nmap gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" When text is wrapped, move by terminal rows not line, unless a count is
" provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copy
vnoremap <leader>p "_dP

" Easy insert of trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Add word to project dictionary
nmap gzg 2zg
nmap gzw 2zw

" Buffer cleaning
function BufOnly ()
  let l:winview = winsaveview()
  execute "%bd|e#|bd#"
  call winrestview(l:winview)
endfunction
nmap <leader>bo :call BufOnly()<CR>

"-------------------------------
" Plugins
"-------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/config/plugins/airline.vim
source ~/.config/nvim/config/plugins/fugitive.vim
source ~/.config/nvim/config/plugins/fzf.vim
source ~/.config/nvim/config/plugins/surround.vim
" source ~/.config/nvim/config/plugins/autopairs.vim
source ~/.config/nvim/config/plugins/coc.vim
source ~/.config/nvim/config/plugins/commentary.vim
source ~/.config/nvim/config/plugins/visual-multi.vim
source ~/.config/nvim/config/plugins/copilot.vim
source ~/.config/nvim/config/plugins/graphql.vim

call plug#end()

"-------------------------------
" Theme
"-------------------------------

hi Pmenu guibg=#003366 gui=NONE
hi PmenuSel guibg=#115588 gui=NONE
hi PmenuSbar guibg=#bcbcbc
hi PmenuThumb guibg=#585858
hi DiffAdd guibg=DarkGreen
hi DiffChange guibg=DarkBlue
hi SignColumn guibg=bg
hi CocWarningHighlight guibg=DarkYellow guifg=Black
hi Visual guibg=#004466

