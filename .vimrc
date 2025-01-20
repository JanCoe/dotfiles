let mapleader = " "

set relativenumber
set number

set scrolloff=999
set colorcolumn="108"
set signcolumn="yes"

set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set hlsearch
set incsearch
set matchtime=2

set virtualedit="block"
set clipboard+=unnamedplus

inoremap jk <Esc>
map H ^
map L $

colorscheme blue

"--- Cursor settings ---
"These settings work with a more modern set up
"set guicursor+=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20 

"These settings work from bash
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"
