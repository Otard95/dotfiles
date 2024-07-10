# ~/.bashrc: executed by bash(1) for non-login shells.

# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
	  color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Fix terminal keep profile and cwd when splitting
if [[ -f /etc/profile.d/vte.sh ]]; then
  source /etc/profile.d/vte.sh
fi

### Default aliases
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

################
##   Zoxide   ##
################

eval "$(zoxide init bash)"

################
##   Custom   ##
################

# Set default shell editor to vim with custom rc
export EDITOR="nvim -u .config/nvim/minimal.lua"
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Set key repeat delay, rate, and layout
xset r rate 160 45
setxkbmap -layout no,us  -option 'grp:alt_space_toggle'

# Git completion
if [[ -f /usr/share/git/completion/git-completion.bash ]]; then
  source /usr/share/git/completion/git-completion.bash
fi

bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'

# thefuck
thefuck -v &> /dev/null
if [[ $? -eq 0 && -f ~/.config/thefuck/.alias ]]; then
  source ~/.config/thefuck/.alias
fi

# fzf
fzf --version &> /dev/null
if [[ $? -eq 0 && -f ~/.fzf/.fzfrc ]]; then
  source ~/.fzf/.fzfrc
fi
# export FZF_DEFAULT_OPTS="--layout=reverse --border --multi --color='border:#24a4b7,hl:#07f2af,bg+:#1f3b3d,separator:#12737a,scrollbar:#12737a,label:#cdeff4,pointer:#85add6,marker:#2a8aaf'"
# Catppuccin fzf theme
export FZF_DEFAULT_OPTS=" \
--layout=reverse --border --multi \
--color=bg+:#414559,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# Secrets
if [ -d ~/.secret ]; then
  for file in $(ls -a ~/.secret); do
    if [[ -f ~/.secret/$file ]] && [[ -n "${file##*ignore*}" ]]; then
      source ~/.secret/$file
    fi
  done
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
if [ -d /home/otard/.local/share/pnpm ]; then
  export PNPM_HOME="/home/otard/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  if [ ! -f $PNPM_HOME/.pnpm_bash_compleations ]; then
    pnpm completion bash > $PNPM_HOME/.pnpm_bash_compleations
  fi
  . $PNPM_HOME/.pnpm_bash_compleations
fi
# pnpm end

# NVM auto use if CWD contains .nvmrc
cdnvm() {
  command cd "$@"
  if [[ -s ".nvmrc" && -r ".nvmrc" ]]; then
    nvm_version=$(<.nvmrc)
    # `nvm ls` will check all locally-available versions
    # If there are multiple matching versions, take the latest one
    # Remove the `->` and `*` characters and spaces
    # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
    locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

    # If it is not already installed, install it
    # `nvm install` will implicitly use the newly-installed version
    if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
        nvm install "$nvm_version";
    elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
        nvm use;
    fi
  fi
}
alias cd='cdnvm'

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

if [[ -d /usr/local/android/cmdline-tools ]]; then
  export PATH="$PATH:/usr/local/android/cmdline-tools/latest/bin"
  export ANDROID_SDK_ROOT="/usr/local/android"
  export ANDROID_HOME="/usr/local/android"
fi
if [[ -d /usr/local/android/emulator ]]; then
  export PATH="$PATH:/usr/local/android/emulator"
fi
if [[ -d /usr/local/android/platform-tools ]]; then
  export PATH="$PATH:/usr/local/android/platform-tools"
fi

if [[ -d ~/dev/personal/kbd/qmk_firmware ]]; then
  source ~/dev/personal/kbd/qmk_firmware/util/qmk_tab_complete.sh
fi
if [[ -d ~/dev/kbd/qmk_firmware ]]; then
  source ~/dev/kbd/qmk_firmware/util/qmk_tab_complete.sh
fi

if [[ -d ~/.local/share/go ]]; then
  export GOPATH="$HOME/.local/share/go"
  export PATH="$PATH:$GOPATH/bin"
fi

# Prompt
if starship -V &> /dev/null; then
  eval "$(starship init bash)"
elif [[ -f ~/.bash_prompt/.prompt ]]; then
  source ~/.bash_prompt/.prompt
fi

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true

if [[ -z "$TMUX" ]]; then
  clear && fastfetch
# fi
else
  fastfetch --logo debian
fi
cdnvm .

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
