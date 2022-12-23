-- let g:airline_theme='luna'
-- " let g:airline_solarized_bg='dark'
-- let g:airline_left_sep = ''
-- let g:airline_left_alt_sep = ''
-- let g:airline_right_sep = ''
-- let g:airline_right_alt_sep = ''
--
-- if !exists('g:airline_symbols')
--   let g:airline_symbols = {}
-- endif
--
-- let g:airline_symbols.branch = ''
-- let g:airline_symbols.colnr = ' :'
-- let g:airline_symbols.readonly = ''
-- let g:airline_symbols.linenr = ' :'
-- let g:airline_symbols.maxlinenr = '☰ '
-- let g:airline_symbols.dirty='⚡'
--
-- " %{airline#util#wrap(airline#extensions#coc#get_status(),0)}
-- let g:airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold#%#__restore__#'

function airline_init(paqInit)
  table.insert(paqInit, 'vim-airline/vim-airline')
  table.insert(paqInit, 'vim-airline/vim-airline-themes')

  vim.cmd([[
    let g:airline_theme='luna'
    " let g:airline_solarized_bg='dark'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_symbols.branch = ''
    let g:airline_symbols.colnr = ' :'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' :'
    let g:airline_symbols.maxlinenr = '☰ '
    let g:airline_symbols.dirty='⚡'

    " %{airline#util#wrap(airline#extensions#coc#get_status(),0)}
    let g:airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold#%#__restore__#'
  ]])

  -- vim.g.airline_theme = 'luna'
  -- vim.g.airline_left_sep = ''
  -- vim.g.airline_left_alt_sep = ''
  -- vim.g.airline_right_sep = ''
  -- vim.g.airline_right_alt_sep = ''

  -- if not vim.g.airline_symbols then
  --   vim.g.airline_symbols = {}
  -- end

  -- vim.g.airline_symbols.branch = ''
  -- vim.g.airline_symbols.colnr = ' :'
  -- vim.g.airline_symbols.readonly = ''
  -- vim.g.airline_symbols.linenr = ' :'
  -- vim.g.airline_symbols.maxlinenr = '☰ '
  -- vim.g.airline_symbols.dirty = '⚡'

  -- vim.g.airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold#%#__restore__#'
end

return airline_init
