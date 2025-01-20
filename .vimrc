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
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"
