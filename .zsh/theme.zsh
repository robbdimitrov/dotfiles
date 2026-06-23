setopt PROMPT_SUBST

# Single git call: branch name + staged/unstaged state.
# Replaces vcs_info + 3 separate git processes with one.
_git_prompt() {
    local output
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
        || branch=$(git rev-parse --short HEAD 2>/dev/null) \
        || return
    echo " (%F{cyan}${branch}%f)"
}

precmd() {
    _git_prompt_str=$(_git_prompt)
}

PROMPT='%F{blue}%1~%f${_git_prompt_str} '
