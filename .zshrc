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

