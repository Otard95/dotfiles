#!/usr/bin/env bash

exec nvim 63<&0 0</dev/null \
    -u NONE \
    -c "map <silent> q :qa!<CR>" \
    -c "set shell=bash scrollback=100000 termguicolors laststatus=0 clipboard+=unnamedplus" \
    -c 'terminal sed </dev/fd/63 -e "s/'$'\x1b'']8;;file:[^\]*[\]//g" && sleep 0.01 && printf "'$'\x1b'']2;"' \
    -c "normal G"

