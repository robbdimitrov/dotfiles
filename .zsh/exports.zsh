# ==============================================================================
# 1. CORE EXPORTS
# ==============================================================================
export LANG=en_US.UTF-8
export EDITOR=vim
export GOPATH=$HOME/.go
export LESS='-R'
export PAGER='less'

# Exclude . - / from word characters to behave like macOS terminal when deleting words
export WORDCHARS=${WORDCHARS//[\.\-\/]/}

# ==============================================================================
# 2. PATH MANAGEMENT
# ==============================================================================
# Remove duplicates from the path array
typeset -U path

# Add directories to your path cleanly (top-down priority)
path=(
  /opt/homebrew/bin
  /opt/homebrew/opt/libpq/bin
  $HOME/.cargo/bin
  $HOME/.local/bin
  $HOME/.go/bin
  $path
)
export PATH
