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

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# Common utilities
alias c='clear'
alias h='history'
alias md='mkdir -p'
alias df='df -h'
alias du='du -h'

# Git shortcuts
alias ga='git add'
alias gaa='git add --all'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git pull'
alias glgg='git log --graph --decorate'
alias glgga='git log --graph --decorate --all'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias grb='git rebase'
alias grm='git rm'
alias gst='git status'
