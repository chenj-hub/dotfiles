#!/usr/bin/env zsh

GIT_AHEAD="⇡"
GIT_BEHIND="⇣"
PROMPT_CHAR="$"
SEPARATOR=" "

# Specific color vars
COLOR=003
COLOR_SUDO=005
GIT_CLEAN_COLOR=007
GIT_DIRTY_COLOR=001
CWD_COLOR=021
PROMPT_OK=008
PROMPT_ERR=009
normal="%{$FX[reset]$FG[255]%}"

setopt PROMPT_SUBST

function git_prompt {
    # Only run if in a  git repo
    if git ls-files >& /dev/null; then
        # Get the current branch name or short SHA1 hash for detached head
        local BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)"

        if [[ -n "$(git status --porcelain)" ]]; then
            GIT_PROMPT="-[$FG[${GIT_DIRTY_COLOR}]  $BRANCH"
        else
            GIT_PROMPT="-[$FG[${GIT_CLEAN_COLOR}]  $BRANCH"
        fi

        # Find out how many commits the local branch is ahead/behind of the remote
        local STAT="$(git status --branch --porcelain)"
        local UNTRACKED="$(git status --porcelain | grep -e "^??" | wc -l | xargs)"
        local MODIFIED="$(git status --porcelain | grep -e "^ M" | wc -l | xargs)"
        local N_AHEAD="$(echo $STAT | grep -o -e "ahead [0-9]\+" | grep -o "[0-9]\+" | xargs)"
        local N_BEHIND="$(echo $STAT | grep -o "behind [0-9]\+" | grep -o "[0-9]\+" | xargs)"
        # Add the info into the prompt
        [ "$UNTRACKED" -gt 0 ] && GIT_PROMPT+=" ?$UNTRACKED"
        [ "$MODIFIED" -gt 0 ] && GIT_PROMPT+=" ~$MODIFIED"
        [ -n "$N_AHEAD" ] && GIT_PROMPT+=" $GIT_AHEAD$N_AHEAD"
        [ -n "$N_BEHIND" ] && GIT_PROMPT+=" $GIT_BEHIND$N_BEHIND"
        GIT_PROMPT+="]"
    else
        GIT_PROMPT=""
    fi
    GIT_PROMPT+="$normal"
}

function precmd() {
    git_prompt
}

PROMPT="┌[%(?.%F{green}√.%F{red}?%?)%f]" # error code 
PROMPT+="-[%F{green}%n%f"                # user name
PROMPT+="%F{magenta}@%f"                 # @ character
PROMPT+="%F{blue}%m%f]"                  # host name
PROMPT+="-[%F{yellow}%*%f]"              # time
PROMPT+="-[%F{yellow}%1~%f]"             # working directory
PROMPT+='$GIT_PROMPT'
PROMPT+="
└───▶ "

