#!/bin/zsh
# Steal what I've done for bash
source ~/.bash_setting

# Prompt
source ~/.config/zsh/simple-prompt.zsh

# zsh specific settings
bindkey -e
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

zstyle ':znap:*' repos-dir ~/znap
source ~/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete

