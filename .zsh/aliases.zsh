# Colors, environment, and shortcuts
if [[ "$OSTYPE" == "darwin"* ]]; then
    export CLICOLOR=1
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -a'
alias ..='cd ..'
alias -- -='cd -'

# Git shortcuts
alias g='git'
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'
