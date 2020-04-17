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
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
