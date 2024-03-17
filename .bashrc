case $HOSTNAME in
  "JCiMac.local") export PATH=$PATH:~/Projects/External/cargo-watch/target/release ;
                  export BASH_SILENCE_DEPRECATION_WARNING=1 ;;
esac

# Use VIM motions in the command line
set -o vi

# Set the prompt
PS1='\[\033]0;$PWD\007\]' 	# set window title
PS1="$PS1"'\n'			# new line
PS1="$PS1"'\[\033[32m\]'	# change to green
PS1="$PS1"'\D{%H:%M:%S} '	# show current time
PS1="$PS1"'\[\033[35m\]'	# change to purple
PS1="$PS1"'\w'			# current working directory
PS1="$PS1"'\[\033[33m\]'	# change to brownish yellow
PS1="$PS1"' $ '			# prompt: always $
PS1="$PS1"'\[\033[0m\]'		# change color

# Check what the operating system is and store in a variable
OP_SYS=""
case "$OSTYPE" in
  linux*)   OP_SYS="linux" ;;
  darwin*)  OP_SYS="mac" ;; 
  msys*)    OP_SYS="windows" ;;
  solaris*) OP_SYS="solaris" ;;
  bsd*)     OP_SYS="bsd" ;;
  *)        OP_SYS="unknown" ;;
esac

# Set aliases
# 'python venv create': can add prompt by appending --prompt="name"
alias pvc="python -m venv .venv --upgrade-deps"

# 'python venv activate': activate virtual environment in the .venv directory
if [ $OP_SYS = "mac" ]; then
  alias pva="source .venv/bin/activate";
else
  alias pva="source .venv/scripts/activate";
fi

# 'python venv install requirements'
alias pvr="python -m pip install -r requirements.txt"

alias pr="python -m" # 'python run': run python module
alias pt="python -m unittest discover" # 'python test': run unittest, need to specify directories
alias pta="python -m unittest discover tests" # 'python test all': run all unittests

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
