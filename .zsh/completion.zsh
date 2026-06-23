# ==============================================================================
# 1. ULTRA-FAST COMPLETION CACHING
# ==============================================================================
ZCOMDUMP="$HOME/.zcompdump"
autoload -Uz compinit

# Performance Hack: Only rebuild completion maps once every 24 hours
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' "$ZCOMDUMP" 2>/dev/null)" ]; then
        compinit -d "$ZCOMDUMP"
    else
        compinit -C -d "$ZCOMDUMP" # Skips security checks, loads instantly
    fi
else
    # Linux fallback equivalent check
    if [ "$(date +'%j')" != "$(stat -c '%Y' "$ZCOMDUMP" 2>/dev/null | xargs -I {} date -d @{} +'%j')" ]; then
        compinit -d "$ZCOMDUMP"
    else
        compinit -C -d "$ZCOMDUMP"
    fi
fi

# ------------------------------------------------------------------------------
# 2. COMPLETION SYSTEM CONFIGURATION
# ------------------------------------------------------------------------------
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# ------------------------------------------------------------------------------
# 3. HISTORY SETTINGS
# ------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST EXTENDED_HISTORY SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS

# ------------------------------------------------------------------------------
# 4. NAVIGATION
# ------------------------------------------------------------------------------
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS

# ------------------------------------------------------------------------------
# 5. KEYBINDINGS
# ------------------------------------------------------------------------------
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
