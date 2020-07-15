#!/usr/bin/env bash

# environment
PS1='λ '

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
