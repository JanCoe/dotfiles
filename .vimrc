set relativenumber
set number

set incsearch

set scrolloff=8
set signcolumn="yes"

map H ^
map L $

"--- Cursor settings ---
"These settings work with a more modern set up
"set guicursor+=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20 

"These settings work from bash
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[1 q"

"These settings work with neovim 
"set -g default-terminal "screen-256color"
"set -ga terminal-overrides ",*256col*:Tc"
"set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q',w 
