vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "108"

vim.api.nvim_set_keymap('', 'H', '^', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('', 'L', '$', { noremap = true, silent = true } )

