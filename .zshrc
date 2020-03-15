# Shell
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
ZSH_THEME=robbyrussell
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User
export EDITOR=vim

# Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$(gem env gemdir)/bin:$PATH

# Python
export PATH=/usr/local/opt/python/libexec/bin:$PATH
