"
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
" set spell
" set spellfile=./dictionary.latin1.add,~/.config/nvim/dictionary.latin1.add
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:->\ ,trail:⋅
set scrolloff=20
set sidescrolloff=10
set clipboard+=unnamedplus
set cmdheight=2
" Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15


"-------------------------------
" Custom Commands
"-------------------------------

source ~/.config/nvim/cmds/uuid.vim
source ~/.config/nvim/cmds/buffers.vim

"-------------------------------
" Key maps
"-------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :so ~/.config/nvim/init.vim<cr>

nmap <leader>\ :Lexplore<CR>

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

" Stop highlight
nnoremap <tab> :noh<CR>

" Easy insert of trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" " Add word to global dictionary
" nmap gzg 2zg
" nmap gzw 2zw

" Buffer cleaning
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

" Looks
source ~/.config/nvim/plug-conf/airline.vim
" Conveniance
source ~/.config/nvim/plug-conf/fugitive.vim
source ~/.config/nvim/plug-conf/fzf.vim
source ~/.config/nvim/plug-conf/copilot.vim
source ~/.config/nvim/plug-conf/commentary.vim
source ~/.config/nvim/plug-conf/surround.vim
source ~/.config/nvim/plug-conf/visual-multi.vim
" Language
source ~/.config/nvim/plug-conf/coc.vim
source ~/.config/nvim/plug-conf/vimspector.vim
source ~/.config/nvim/plug-conf/treesitter.vim
" Tools
source ~/.config/nvim/plug-conf/tig.vim
source ~/.config/nvim/plug-conf/quickmaths.vim

call plug#end()
doautocmd User PlugLoaded

"-------------------------------
" Theme
"-------------------------------

hi Pmenu guibg=#003366 gui=NONE
hi PmenuSel guibg=#115588 gui=NONE
hi PmenuSbar guibg=#bcbcbc
hi PmenuThumb guibg=#585858
hi DiffAdd guibg=bg guifg=DarkGreen gui=bold
hi DiffChange guibg=bg guifg=DarkYellow gui=bold
hi SignColumn guibg=bg
hi CocWarningHighlight guibg=DarkYellow guifg=Black
hi Visual guibg=#004466

