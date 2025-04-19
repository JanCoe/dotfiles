# Source .profile manually (if not a login shell)
[[ -f $HOME/.profile ]] && . $HOME/.profile
[[ -f $HOME/.shell_aliases ]] && . $HOME/.shell_aliases

# File extensions to run in neovim 
alias -s py=nvim
alias -s config=nvim
alias -s cfg=nvim
alias -s yaml=nvim
alias -s rs=nvim
#
# Use vim motions in command line 
bindkey -v

# Start applications
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
alias cd="z"
