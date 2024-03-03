# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

. "$HOME/.cargo/env"

# bash_profile instead of bashrc is called from a login shell. Force bashrc to run too
source ~/.bashrc
