# Settings that depend on operating system 
if [ "$OSTYPE" == "msys" ] # Windows
then #
    alias pva="source .venv/scripts/activate" # Python Venv Activate
else # Mac or Linux
    alias pva="source .venv/bin/activate" # Python Venv Activate
fi

if [ "$OSTYPE" == "linux-gnu" ] # Linux
then
    alias vi="/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=vim --file-forwarding org.vim.Vim"
fi

# Python Venv Create: first (optional) argument is name of prompt
function pvc
{
    if [ "$#" -eq 0 ]
    then
        python -m venv .venv --upgrade-deps
    else
       python -m venv .venv --upgrade-deps --prompt="$1"
    fi
}

# 'Python Venv install Requirements'
alias pvr="python -m pip install -r requirements.txt"

alias pr="python -m"                   # 'Python Run': run python module
alias pt="python -m unittest discover" # 'Python Test': run unittest, can specify directories

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."