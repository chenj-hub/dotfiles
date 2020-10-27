source ~/.bash_profile

# environment
PS1=$'[%{\e[0;33m%}%n%{\e[0m%}|%{\e[1;30m%}%M%{\e[0m%}|%B%d%b] '
RPROMPT="(%D{%d.%m.%y} | %*)"

# zsh specific settings
bindkey -v
bindkey '^R' history-incremental-search-backward
