# zsh
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git docker kubectl)
source $ZSH/oh-my-zsh.sh

# User
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Ruby
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
