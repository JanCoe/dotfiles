# Use VIM motions in the command line
set -o vi

# Set the prompt
PS1='\[\033]0;$PWD\007\]' # set window title
PS1="$PS1"'\n'            # new line
PS1="$PS1"'\[\033[32m\]'  # change to green
PS1="$PS1"'\D{%H:%M:%S} ' # show current time
PS1="$PS1"'\[\033[35m\]'  # change to purple
PS1="$PS1"'\w'            # current working directory
PS1="$PS1"'\[\033[33m\]'  # change to brownish yellow
PS1="$PS1"' $ '           # prompt: always $
PS1="$PS1"'\[\033[0m\]'   # change color

# Settings that depend on operating system
case "$OSTYPE" in
darwin*) PYTH=python3 ; # mac
         export BASH_SILENCE_DEPRECATION_WARNING=1 ;
         # 'python venv activate': activate virtual environment in the .venv directory
	     alias pva="source .venv/bin/activate" ;;
msys*) PYTH=python ; # windows
       # 'python venv activate': activate virtual environment in the .venv directory
       alias pva="source .venv/scripts/activate" ;;
esac

# Set aliases
# 'python venv create': first (optional) argument is name of prompt
function pvc
{
  if [ "$#" -eq 0 ]; then
    $PYTH -m venv .venv --upgrade-deps
  else
    $PYTH -m venv .venv --upgrade-deps --prompt="$1"
  fi
}

# 'python venv install requirements'
alias pvr="$PYTH -m pip install -r requirements.txt"

alias pr="$PYTH -m"                   # 'python run': run python module
alias pt="$PYTH -m unittest discover" # 'python test': run unittest, can specify directories

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
