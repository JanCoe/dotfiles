
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/JanCoe/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/JanCoe/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/JanCoe/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/JanCoe/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set the prompt. The %F{ } sets a colour and %f resets to the default.
# 3~ gives up to three parent directories. Follow it with a :
PS1="%F{29}%3~:%f"

# Python aliases
alias pv='source .venv/bin/activate' # 'python venv': activate virtual environment in the .venv directory
alias pm='python3 -m' # 'python module': run python module
alias pt='python3 -m unittest discover' # 'python test': run unittest, need to specify directories
alias pta='python3 -m unittest discover tests' # 'python test all': run all unittests

# Other aliases
alias fzn='fzf | xargs nvim' # 'fzf neovim': pipe fzf output into neovim
alias fzp="fzf --preview 'cat {}' | xargs nvim" # 'fzf preview': get a preview of the fzf output and pipe it into neovim

# File extensions to run in neovim 
alias -s py=nvim
alias -s config=nvim
alias -s yaml=nvim
alias -s rs=nvim

