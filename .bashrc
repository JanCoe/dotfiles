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
if [ "$OSTYPE" == "darwin" ]  # MacOS
then
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

source ~/.bash_aliases
