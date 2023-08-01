#!/bin/zsh
# Steal what I've done for bash
source ~/.bash_setting

# Prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b [%*] %# '

# zsh specific settings
bindkey -e
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

zstyle ':znap:*' repos-dir ~/znap
source ~/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete
