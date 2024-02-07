# tab completion for aliases
. ~/.complete_alias

# Commands
alias ll='exa -alhF'
alias la='exa -A'
alias l='exa -F'

alias mine='sudo chown $USER:$GROUP -R $1'
alias x='chmod u+x $1'
alias m='pmount $@'
alias um='pumount $@'

alias vim='nvim'
alias vi='nvim'

alias bt='bluetoothctl'

alias rm='trash'

# NPM
alias n='pnpm'
alias ni='pnpm install'
alias nid='pnpm install -D'
alias nie='pnpm install -E'
alias nide='pnpm install -DE'
alias nr='pnpm run'

complete -F _complete_alias n
complete -F _complete_alias ni
complete -F _complete_alias nid
complete -F _complete_alias nie
complete -F _complete_alias nide
complete -F _complete_alias nr

# Scripts
alias mod='~/scripts/mod'
alias note='~/scripts/note'
alias ssh-new-key='~/scripts/ssh-new-key'
alias auto-bt='~/scripts/auto-bt.sh'
alias ghprcopy='~/scripts/gh-pr-copy'

# Secrets
if [[ -f ~/.bash_aliases_personal ]]; then
    source ~/.bash_aliases_personal
fi

# Executables
alias gql-gc='/opt/graphql-config-generator/gql-gc'
alias ngm='/opt/ngm/ngm-linux'
alias kub='kubectl'

# Tmux
alias tn='tmux new -s$(pwd | sed "s/.*\///g")'
tx(){
    tmux new -s "$1" "$1"
}
