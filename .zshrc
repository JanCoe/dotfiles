# Source aliases
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

# File extensions to run in neovim 
alias -s cfg=nvim
alias -s config=nvim
alias -s py=nvim
alias -s rs=nvim
alias -s yaml=nvim

# Use vim motions in command line 
bindkey -v

# Start applications
if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

source <(fzf --zsh)
