vim.g.mapleader = "<C-a>"
vim.g.maplocalleader = "//"

local keymap = vim.keymap.set
local opts = { noremap = false, silent = true }
-- Use SHIFT + h,l for larger movements 
keymap({ 'n', 'v' }, 'H', '^', opts)
keymap({ 'n', 'v' }, 'L', '$', opts)
