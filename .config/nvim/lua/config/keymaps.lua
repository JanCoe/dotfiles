vim.g.mapleader = " "
-- vim.g.maplocalleader = "//"

local opts = { noremap = false, silent = true }
-- Use SHIFT + h,l for larger movements 
vim.keymap.set({ 'n', 'v' }, 'H', '^', opts)
vim.keymap.set({ 'n', 'v' }, 'L', '$', opts)
vim.keymap.set('n', '<leader>w', ':update<CR>')  -- write only if file has changed
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>s', ':source<CR>')
