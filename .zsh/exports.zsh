# Environment variable exports

export LESS='-R'
export PAGER='less'

# Exclude . - / from word characters to behave like macOS terminal when deleting words
WORDCHARS=${WORDCHARS//[\.\-\/]/}
