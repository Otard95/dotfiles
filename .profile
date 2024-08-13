# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
export TERMINAL=kitty

if [ -d "/usr/bin" ] ; then
  PATH="/usr/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

if [ -d "/snap/bin" ] ; then
  PATH="/snap/bin:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
  PATH="/usr/local/go/bin:$PATH"
fi

if [ -f "/usr/bin/qt5ct" ] ; then
  export QT_QPA_PLATFORMTHEME=qt5ct
fi

if [ -n "$HOME" ]; then
  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
  fi

  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
  fi

  # Update path with npm bin, user bin, user local bin and snap bin
  if [ -d "$HOME/.npm/bin" ] ; then
    PATH="$HOME/.npm/bin:$PATH"
  fi

  # Update path with tmux plugins
  # .tmux/plugins/t-smart-tmux-session-manager/bin/
  if [ -d "$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin" ] ; then
    PATH="$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
  fi

  if [ -d "$HOME/.deno" ] ; then
    export DENO_INSTALL="$HOME/.deno"
    PATH="$DENO_INSTALL/bin:$PATH"
  fi

  # if running bash
  if [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
  fi
fi
