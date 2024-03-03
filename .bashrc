export BASH_SILENCE_DEPRECATION_WARNING=1

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
operating_system=""
case "$OSTYPE" in
  linux*)   operating_system="linux" ;;
  darwin*)  operating_system="mac" ;; 
  msys*)    operating_system="windows" ;;
  solaris*) operating_system="solaris" ;;
  bsd*)     operating_system="bsd" ;;
  *)        operating_system="unknown" ;;
esac

# Set aliases
# 'python venv': activate virtual environment in the .venv directory
if [ $operating_system = "mac" ]; then
  alias pv='source .venv/bin/activate'
else
  alias pv='source .venv/scripts/activate'
fi

alias pr='python3 -m' # 'python run': run python module
alias pt='python3 -m unittest discover' # 'python test': run unittest, need to specify directories
alias pta='python3 -m unittest discover tests' # 'python test all': run all unittests

