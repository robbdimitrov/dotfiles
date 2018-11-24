# zsh config
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git nvm pip python ruby docker docker-compose kubectl golang)
source $ZSH/oh-my-zsh.sh

# User config
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor
export EDITOR='vim'

# ssh
export SSH_PATH="~/.ssh"

# Ruby config
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Python config
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Go config
export PATH="$PATH:/usr/local/go/bin"

# Alias
alias code='open $@ -a "Visual Studio Code"'
