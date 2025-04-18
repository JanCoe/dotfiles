export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$HOME/.local/bin"

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export TERMINAL=wezterm

export PATH
# Python aliases
alias pva='source .venv/bin/activate' # 'python venv': activate virtual environment in the .venv directory
alias pr='python3 -m' # 'python module': run python module

# Other aliases
alias fzn='fzf | xargs nvim' # 'fzf neovim': pipe fzf output into neovim
alias fzp="fzf --preview 'cat {}' | xargs nvim" # 'fzf preview': get a preview of the fzf output and pipe it into neovim
alias lines="git ls-files | grep .py | xargs cat | wc -l"

# File extensions to run in neovim 
alias -s py=nvim
alias -s config=nvim
alias -s yaml=nvim
alias -s rs=nvim
# . "$HOME/.local/bin/env"

# Run starship
eval "$(starship init zsh)"
