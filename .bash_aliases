alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias mine='sudo chown $USER:$GROUP -R $1'
alias m='sudo pmount $@'
alias um='sudo pumount $@'

alias vim='nvim'
alias vi='nvim'

alias bt='bluetoothctl'

alias mod='~/scripts/mod'
alias note='~/scripts/note'
alias ssh-new-key='~/scripts/ssh-new-key'
alias nvm='~/scripts/nvm'
alias auto-bt='~/scripts/auto-bt.sh'

alias g='git'
# __git_complete g __git_main

if [[ -f ~/.bash_aliases_personal ]]; then
    source ~/.bash_aliases_personal
fi

alias gql-gc='/opt/graphql-config-generator/gql-gc'
alias ngm='/opt/ngm/ngm-linux'
