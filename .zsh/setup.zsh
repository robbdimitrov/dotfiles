# Central initialization script for your DIY Zsh setup

# Get the directory where this script resides dynamically
# (This ensures it works even if you move the folder later)
ZSH_CUSTOM_DIR="${0:A:h}"

# Explicitly source your modules in a logical order
# (e.g., completions first, then theme, then aliases)
[[ -f "$ZSH_CUSTOM_DIR/completion.zsh" ]] && source "$ZSH_CUSTOM_DIR/completion.zsh"
[[ -f "$ZSH_CUSTOM_DIR/theme.zsh" ]]      && source "$ZSH_CUSTOM_DIR/theme.zsh"
[[ -f "$ZSH_CUSTOM_DIR/aliases.zsh" ]]    && source "$ZSH_CUSTOM_DIR/aliases.zsh"
