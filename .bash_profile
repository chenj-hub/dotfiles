#!/usr/bin/env bash

# Set to vi mode
set -o vi
export VISUAL=vim
export EDITOR="$VISUAL"

# Disable per-terminal-session command history
SHELL_SESSION_HISTORY=0

# no duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Auto Install Files
if [ -f ~/.config/bash/.autoinstall ]; then
  source ~/.config/bash/.autoinstall
fi

if [ -x "$(command -v pyenv)" ]; then
  source ~/.py_setup
fi

# Setup emacs
if [ -d ~/.emacs.d/bin ]; then
  export PATH="$HOME/.emacs.d/bin:$PATH"
fi

