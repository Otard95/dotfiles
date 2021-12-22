
################
##   Custom   ##
################

# Update path with npm bin and user bin
PATH="$PATH:/home/otard/.npm/bin:/usr/bin"

# Set default shell editor to vim with custom rc
export EDITOR="vim -u ./.vimrc-simple"

# Set key repeat delay and rate
xset r rate 160 45

# Git completion
if [[ -f /usr/share/git/completion/git-completion.bash ]]; then
  source /usr/share/git/completion/git-completion.bash
fi

# thefuck
thefuck -v &> /dev/null
if [[ $? -eq 0 && -f ./.thefuck/.alias ]]; then
  source ./.thefuck/.alias
fi

# GitHub CLI
if [[ -f ./.secret/.github-cli ]]; then
  source ./.secret/.github-cli
fi 

# Prompt
git --version &> /dev/null
if [[ $? -eq 0 && -f ./.bash_prompt/.git-prompt ]]; then
  source ./.bash_prompt/.git-prompt
fi 
