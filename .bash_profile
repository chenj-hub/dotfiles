#!/usr/bin/env bash

# environment
PS1="$(whoami)@$(hostname) $(pwd)$(echo $'\nλ') "

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
