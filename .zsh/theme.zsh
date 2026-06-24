setopt PROMPT_SUBST

_git_prompt() {
    local branch
    
    if branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
       branch=$(git rev-parse --short HEAD 2>/dev/null); then
        _git_prompt_str=" (%F{cyan}${branch}%f)"
    else
        _git_prompt_str=""
    fi
}

precmd() {
    _git_prompt
}

PROMPT='%F{blue}%1~%f${_git_prompt_str} %(?.%F{green}.%F{red})%(!.#.$)%f '
