
Plug 'puremourning/vimspector'

nmap <C-g><C-s> <Plug>VimspectorContinue
nmap <C-g><C-s><C-s> <Plug>VimspectorStop
nmap <C-g><C-r> :VimspectorReset<CR>
nmap <C-g><C-p> <Plug>VimspectorPause
nmap <C-g><C-b><C-b> <Plug>VimspectorToggleBreakpoint
nmap <C-g><C-b>c <Plug>VimspectorToggleConditionalBreakpoint
nmap <C-g><C-l> <Plug>VimspectorRunToCursor
nmap <C-g><C-n> <Plug>VimspectorStepOver
nmap <C-g><C-i> <Plug>VimspectorStepInto
nmap <C-g><C-o> <Plug>VimspectorStepOut
nmap <C-g><C-k> <Plug>VimspectorBalloonEval

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         13,
  \    'vimspectorBPCond':     12,
  \    'vimspectorBPLog':      12,
  \    'vimspectorBPDisabled': 11,
  \    'vimspectorPC':         999,
  \ }
